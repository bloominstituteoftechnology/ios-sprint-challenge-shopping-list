import UIKit

struct Shopping {
    
    let image: UIImage
    let name: String
    var like: Bool
    
    init(image: UIImage, name: String, like: Bool) {
        self.image = image
        self.name = name
        self.like = like
    }
}
