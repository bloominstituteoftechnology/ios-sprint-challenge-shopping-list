import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    var shopping: Shopping?
    
//    func updateViews() {
//        if let shopping = shopping {
//
//            foodName.text = shopping.name
//
//            if shopping.like == true {
//                checkAction.setText(imageView, for: .normal)
//            } else if shopping.like == false {
//                checkAction.setImage(#imageLiteral(resourceName: "apple"), for: .normal)
//            }
//
//       }
//   }
    
    weak var delegate: ShoppingTableViewCellDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addOrNot: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBAction func checkAction(_ sender: Any) {
        delegate?.toggleAdd(for: self)
       // updateViews
    }
    
}
