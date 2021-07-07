import UIKit

struct ShoppingItem {
    
    init(name: String, imageName: String, isAdded: Bool = false){
        self.name = name
        self.image = UIImage(named: imageName)!
        self.isAdded = isAdded
    }
    
    var name: String
    var image: UIImage
    var isAdded: Bool
}
