import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var itemAddedBool: UILabel!
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemName: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        itemName.text = shoppingItem?.itemName
        itemImage.image = UIImage(named: shoppingItem!.itemName)
        itemAddedBool.text = itemBoomString(added: shoppingItem!.hasBeenAdded)
    }
}


extension ItemCollectionViewCell {
    func itemBoomString(added: Bool) -> String {
        if added {
            return "Added"
        } else {
            return "Not Added"
        }
    }
}
