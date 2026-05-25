
import SwiftUI

struct ContentView: View {
  let menuItems = ["Coffee", "Tea", "Donut", "Blueberry Muffin"]
  var body: some View {
      TabView {
          WelcomeView()
          OrderView(orderName: "Order 1", menuItem: menuItems, storageKey: "order1Items")
          OrderView(orderName: "Order 2", menuItem: menuItems, storageKey: "order2Items")
          OrderView(orderName: "Order 3", menuItem: menuItems, storageKey: "order3Items")
      }
      .tabViewStyle(
        PageTabViewStyle(indexDisplayMode: .never)
      )
  }
}

#Preview {
  ContentView()
}
