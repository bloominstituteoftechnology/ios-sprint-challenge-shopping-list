
import Foundation

class ShoppingItem: Codable, Equatable {
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.itemName == rhs.itemName
    }
    
    var itemName: String
    var wasAdded: Bool
    
    init(itemName: String) {
        self.itemName = itemName
        self.wasAdded = false
    }
}


