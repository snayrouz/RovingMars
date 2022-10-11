import SwiftUI

struct LatestView: View {
  var body: some View {
    NavigationView {
      ZStack {
        AsyncImage(url: URL(string: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03373/opgs/edr/ncam/NRB_696919762EDR_S0930000NCAM00594M_.JPG")
        ) { phase in
          switch phase {
            // 1
          case .empty:
            MarsProgressView()
            // 2
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
          case .failure(let error):
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
