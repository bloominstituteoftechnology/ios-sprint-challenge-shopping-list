import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    func itemToggled(on cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        photoImageView?.image = UIImage(data: shoppingItem.imageData)
        itemLabel?.text = shoppingItem.item
        if shoppingItem.addedToList == true {
            addedLabel?.text = "Added"
        } else {
            addedLabel?.text = "Not Added"
        }
    }
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
}
