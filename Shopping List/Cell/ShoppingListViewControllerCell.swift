import UIKit

class ShoppingListViewControllerCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var inShoppingList: UILabel!
    
    
    
    var item: ShoppingItem? { didSet { updateViews() }}
    
    func updateViews() {
        guard let item = item else { return }
        let image = UIImage.init(imageLiteralResourceName: item.imageName)
        imageView.image = image
        nameLabel.text = item.name
        inShoppingList.text = item.inShoppingList ?  "Add" : "Did not add"
        inShoppingList.textColor = item.inShoppingList ? .yellow : .lightGray
    }
    
    var shoppingItem: ShoppingItem?
    
}
    


