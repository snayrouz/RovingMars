import SwiftUI

struct LatestView: View {
  var body: some View {
    NavigationView {
      ZStack {
        AsyncImage(
          url: URL(string: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03373/opgs/edr/ncam/NRB_696919762EDR_S0930000NCAM00594M_.JPG")
        ) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        } placeholder: {
          MarsProgressView()
        }
      }
      .navigationTitle("Latest Photos")
    }
  }
}

struct LatestView_Previews: PreviewProvider {
  static var previews: some View {
    LatestView()
  }
}
