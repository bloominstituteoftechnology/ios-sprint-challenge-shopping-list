import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {

    

    @IBOutlet weak var shoppingItemView: UIImageView!
    
    @IBOutlet weak var shoppingItemLabel: UILabel!

    @IBOutlet weak var addedSwitch: UISwitch!
    
    @IBAction func addItem(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(addedSwitch.isOn, forKey: "Added")
    }
    
}
