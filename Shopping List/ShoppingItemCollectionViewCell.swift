import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    func itemToggled(on cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? 
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemlabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
}
