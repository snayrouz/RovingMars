import SwiftUI

struct RoversListView: View {
  var body: some View {
    NavigationView {
      ZStack {
        MarsProgressView()
      }
      .navigationTitle("Mars Rovers")
    }
  }
}

struct RoversListView_Previews: PreviewProvider {
  static var previews: some View {
    RoversListView()
  }
}
