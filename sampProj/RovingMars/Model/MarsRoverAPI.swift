import Foundation

struct MarsRoverAPI {
  enum APIError: Error {
    case requestURLInvalid(String)
  }

  let apiKey = "PUT KEY HERE"
  let apiURLBase = "https://api.nasa.gov/mars-photos/api/v1"

  func allRovers() async throws -> [Rover] {
    let api = APIRequest<RoversContainer>(urlString: "\(apiURLBase)/rovers")
    let container = try await request(api, apiKey: apiKey)
    return container.rovers
  }

  func latestPhotos(rover: Rover) async throws -> [Photo] {
    let api = APIRequest<LatestPhotos>(urlString: "\(apiURLBase)/rovers/\(rover.name)/latest_photos")
    let container = try await request(api, apiKey: apiKey)
    return container.photos
  }

  func photoManifest(rover: Rover) async throws -> PhotoManifest {
    let api = APIRequest<PhotoManifestContainer>(urlString: "\(apiURLBase)/manifests/\(rover.name)")
    let container = try await request(api, apiKey: apiKey)
    return container.photoManifest
  }

  func photos(roverName: String, sol: Int) async throws -> [Photo] {
    let api = APIRequest<PhotosContainer>(urlString: "\(apiURLBase)/rovers/\(roverName)/photos?sol=\(sol)")
    let container = try await request(api, apiKey: apiKey)
    return container.photos
  }

  func request<T>(_ apiRequest: APIRequest<T>, apiKey: String) async throws -> T {
    log.debug("Making request \(apiRequest.urlString)")
    guard var components = URLComponents(string: apiRequest.urlString) else {
      throw APIError.requestURLInvalid(apiRequest.urlString)
    }

    // Make sure the API key is always in the request query string
    let queryItems = (components.queryItems ?? []) + [URLQueryItem(name: "api_key", value: apiKey)]
    components.queryItems = queryItems

    guard let apiURL = components.url else {
      throw APIError.requestURLInvalid(apiRequest.urlString)
    }

    let request = URLRequest(url: apiURL)
    let data = try await URLSession.shared.data(for: request, delegate: nil).0
    return try apiRequest.decodeJSON(data)
  }
}

struct APIRequest<T: Decodable> {
  var urlString: String
  let decodeJSON: (Data) throws -> T
}

extension APIRequest {
  init(urlString: String) {
    self.urlString = urlString
    self.decodeJSON = { data in
      return try JSONDecoder().decode(T.self, from: data)
    }
  }
}
