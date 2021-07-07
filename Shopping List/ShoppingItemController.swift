import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    // this is a directory on my device for information/data to be saved in
    let url = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("shoppingItems.json")
    
    
    // this is taking the data from shoppingItem and saving it into our device/specific folder
    func saveDataTo() {
        do {
            let shoppingItemsEncoded = try JSONEncoder().encode(shoppingItems)
            try shoppingItemsEncoded.write(to: url)
        } catch {
            print("Error: \(error)")
        }
    }
    
    //this takes the information from the device and sets it to shoppingItems
    func loadDataFrom() {
        do {
            let shoppingItemsData = try Data(contentsOf: url)
            let shoppingItemsDecoded = try JSONDecoder().decode([ShoppingItem].self, from: shoppingItemsData)
            shoppingItems = shoppingItemsDecoded
        } catch {
            print("Error: \(error)")
        }
    }
    
    
    // creating a shoppingItem instances
    func createShoppingItem(name: String, isAdded: Bool) {
        let shoppingItem = ShoppingItem(name: name, isAdded: isAdded)
        shoppingItems.append(shoppingItem)
        saveDataTo()
    }
}

