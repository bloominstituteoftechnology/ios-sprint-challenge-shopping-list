import UIKit

class ShoppingItem: Codable {
    
    let name: String
    var isAdded: Bool
    
    init(name: String, isAdded: Bool = false) {
        (self.name, self.isAdded) = (name, isAdded)
    }
}
