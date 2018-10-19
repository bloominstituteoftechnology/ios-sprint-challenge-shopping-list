import Foundation

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var imageData: Data
    var isInShoppingList: Bool
    
    init(name: String, imageData: Data, isInShoppingList: Bool = false) {
        self.name = name
        self.imageData = imageData
        self.isInShoppingList = isInShoppingList
    }
}
