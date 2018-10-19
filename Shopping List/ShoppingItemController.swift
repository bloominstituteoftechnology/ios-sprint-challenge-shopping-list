import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppinglist.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
}
