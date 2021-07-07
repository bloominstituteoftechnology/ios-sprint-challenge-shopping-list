import UIKit

struct ShoppingItem: Equatable, Codable {
    var image: String
    var item: String
    var addedToList: Bool
    
    init(image: String, item: String, addedToList: Bool = false) {
        self.image = image
        self.item = item
        self.addedToList = addedToList
    }
}
