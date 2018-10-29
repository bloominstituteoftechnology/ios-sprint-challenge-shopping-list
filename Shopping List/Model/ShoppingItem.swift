import Foundation

class ShoppingItem: Codable, Equatable {
    
    var name: String
    var inShoppingList: Bool
    var imageName: String
    
    init(name: String, inShoppingList: Bool, imageName: String) {
        self.name = name
        self.inShoppingList = inShoppingList
        self.imageName = imageName
    }
    
    static func ==(lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name &&
            lhs.inShoppingList == rhs.inShoppingList &&
            lhs.imageName == rhs.imageName
    }
}
