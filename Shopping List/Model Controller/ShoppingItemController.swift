import Foundation
import UIKit

class ShoppingItemController {
    
    var shoppingItem = [ShoppingItem]()
    
    func newItem(item: String, image: String) {
        let item = ShoppingItem(image: image, item: item)
        shoppingItem.append(item)
    }
    
    private let itemsAvailable = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
}

let url = URL(fileURLWithPath: NSHomeDirectory())
.appendingPathComponent("Documents")
.appendingPathComponent("ShoppingItem.json")

func saveToFile() {
    do {
        let data = try JSONEncoder().encode(ShoppingItem)
        try data.write(to: url)
    } catch {
        print("Error while saving Shopping Item")
        return
    }
}

func loadFromFile() {
    do {
        let data = try Data(contentsOf: url)
        let itemDecoded = try JSONEncoder().encode([ShoppingItem].self)
        ShoppingItem = itemDecoded
    } catch {
    print("error while trying to load Shopping item")
    return
}
}




