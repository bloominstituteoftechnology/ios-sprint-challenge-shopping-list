import UIKit

struct Shopping:  Equatable, Codable {
    
    var name: String
    var picture: Data?
    //let image: UIImage
    var addOrNot: Bool
    var foodName: String
    
    
    init (name: String, foodName: String, addOrNot: Bool = false) {

        self.addOrNot = false
        self.foodName = foodName
        self.name = name
    }
    
    
    //    static func == (lhs: Shopping, rhs: Shopping) -> Bool {
    //        if lhs.image == rhs.image && lhs.foodName == rhs.foodName {
    //            return true
    //        }
    //        return false
    //    }
    
    //    var ratio: CGFloat {
    //        get {
    //            return image.size.height / image.size.width
    //        }
    //    }
    
    
    
}

