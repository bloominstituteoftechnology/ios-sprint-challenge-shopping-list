
import Foundation

class ShoppingItem: Codable, Equatable {

    // Equatable is needed for the toggle func to work (at least).
    
    var itemName: String
    var wasAdded: Bool
    
    init(itemName: String) {
        self.itemName = itemName
        self.wasAdded = false
    }
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        lhs.itemName == rhs.itemName
    }
}


