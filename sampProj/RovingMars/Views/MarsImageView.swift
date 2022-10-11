import SwiftUI

struct MarsImageView: View {
  let photo: Photo

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .fill(Color.black)
      VStack {
        AsyncImage(url: URL(string: photo.imageSource)) { phase in
          switch phase {
          case .empty:
            Spacer()
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
              .clipShape(RoundedRectangle(cornerRadius: 8))
          case .failure(let error):
            Spacer()
            VStack {
              Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
              Text(error.localizedDescription)
                .font(.caption)
                .multilineTextAlignment(.center)
            }
          @unknown default:
            EmptyView()
          }
        }
        Spacer()
        MarsImageInfoView(photo: photo)
      }
      .padding()
    }
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

struct MarsImageView_Previews: PreviewProvider {
  static var previews: some View {
    MarsImageView(photo: Photo(
      id: 1,
      sol: 1,
      camera: Camera(name: "CMF", fullName: "Camera McLens Face"),
      imageSource: "https://example.com",
      earthDate: "2022-01-12",
      rover: PhotoRoverReference(
        id: 1,
        name: "Rovy",
        landingDate: "2019-01-01",
        launchDate: "2018-12-31",
        status: "active"
        )
      )
    )
  }
}
