import UIKit

struct Shopping: Codable, Equatable {
    
    let image: UIImage
    let name: String
    var like: Bool
    
    init(image: UIImage, name: String, like: Bool = false) {
        self.image = UIImage(named: name)!
        self.name = name
        self.like = like
    }
}
