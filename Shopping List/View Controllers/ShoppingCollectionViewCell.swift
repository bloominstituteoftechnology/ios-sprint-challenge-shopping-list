import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShoppingTableViewCellDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addOrNot: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBAction func checkAction(_ sender: Any) {
        delegate?.toggleAdd(for: self)
    }
    
}
