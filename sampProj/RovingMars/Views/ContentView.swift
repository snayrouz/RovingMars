import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      LatestView()
        .tabItem {
          Label("Latest", systemImage: "video.fill")
        }
      RoversListView()
        .tabItem {
          Label("Rovers", systemImage: "network")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
