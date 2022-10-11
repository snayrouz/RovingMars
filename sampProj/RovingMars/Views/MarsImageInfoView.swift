import SwiftUI

struct MarsImageInfoView: View {
  let photo: Photo
    var body: some View {
      VStack(alignment: .leading) {
        HStack(alignment: .top) {
          Text("Earth date:")
          Text.marsDateText(dateString: photo.earthDate)
        }
        HStack(alignment: .top) {
          Text("Sol:")
          Text("\(photo.sol)")
        }
        HStack(alignment: .top) {
          Text("Camera:")
          Text("\(photo.camera.fullName) (\(photo.camera.name))")
        }
        Divider()
        HStack(alignment: .top) {
          Text("Rover:")
          Text(photo.rover.name)
        }
        HStack(alignment: .top) {
          Text("Launch:")
          Text.marsDateText(dateString: photo.rover.launchDate)
        }
        HStack(alignment: .top) {
          Text("Landing:")
          Text.marsDateText(dateString: photo.rover.landingDate)
        }
        HStack(alignment: .top) {
          Text("Status:")
          Text(photo.rover.status)
        }
      }
      .font(.caption)
      .foregroundColor(.white)
    }
}

struct MarsImageInfoView_Previews: PreviewProvider {
  static var previews: some View {
    MarsImageInfoView(photo:
      Photo(
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
    .background(Color.black)
  }
}
