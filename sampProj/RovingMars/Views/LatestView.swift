import SwiftUI

struct LatestView: View {
  var body: some View {
    NavigationView {
      ZStack {
        MarsProgressView()
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
