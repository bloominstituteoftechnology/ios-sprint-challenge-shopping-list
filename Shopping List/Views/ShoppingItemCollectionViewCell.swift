
import UIKit

protocol ShoppingItemCollectonViewCellDelegate: class {
    
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        addedLabel.text = shoppingItem.wasAdded ? "Added" : "Not Added"
        itemImageView.image = UIImage(named: shoppingItem.itemName)
        nameLabel.text = shoppingItem.itemName
    }
}
