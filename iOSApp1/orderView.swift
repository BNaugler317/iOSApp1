import SwiftUI

struct OrderView: View {
    let orderName: String
    let menuItem: [String]
    let storageKey: String
    
    @State private var orderItems: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text(orderName)
            Text("Create Your Order")
            
            ForEach(menuItem, id: \.self) { item in
                Button("Add \(item)") {
                    orderItems.append(item)
                    UserDefaults.standard.set(orderItems, forKey: storageKey)
                }
            }
            
            Text("Current Order:")
            
            ForEach(orderItems.indices, id: \.self) { index in
                Text(orderItems[index])
            }
            Button("Clear Order") {
                orderItems.removeAll()
                UserDefaults.standard.set(orderItems, forKey: storageKey)
            }
        }
        .onAppear {
            orderItems = UserDefaults.standard.stringArray(forKey: storageKey) ?? []
        }
    }
}

#Preview {
    OrderView(
        orderName: "Order 1",
        menuItem: ["Coffee", "Tea", "Donut", "Blueberry Muffin"],
        storageKey: "order1Items"
    )
}
