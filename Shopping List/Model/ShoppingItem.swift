import UIKit


struct ShoppingItem {
    var image: String
    var item: String
    var requested: Bool
    
    init(image: String, item: String, requested: Bool = false) {
        self.image = image
        self.item = item
        self.requested = requested
    }
    
    
}


