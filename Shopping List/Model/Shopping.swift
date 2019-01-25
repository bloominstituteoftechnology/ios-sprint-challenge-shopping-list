import UIKit

struct Shopping:  Equatable {
    
    let image: UIImage
    var addOrNot: Bool
    var foodName: String
    
    init (image: UIImage, addOrNot: Bool = false, foodName: String) {
        self.image = image
        self.addOrNot = addOrNot
        self.foodName = foodName
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

