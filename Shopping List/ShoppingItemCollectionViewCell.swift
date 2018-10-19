import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isInShoppingListLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item,
            let image = UIImage(data: item.imageData) else { return }
        imageView.image = image
        nameLabel.text = item.name
        isInShoppingListLabel.text = item.isInShoppingList ? "Added" : "Not Added"
        isInShoppingListLabel.textColor = item.isInShoppingList ? .green : .lightGray
    }
}
