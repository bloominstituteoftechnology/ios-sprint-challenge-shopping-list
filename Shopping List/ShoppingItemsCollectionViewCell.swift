import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        updateViews()
//    }
//    private func updateViews() {
//        let userDefaults = UserDefaults.standard
//        added.isOn = userDefaults.bool(forKey: .addedKey)
//    }
    

    @IBOutlet weak var shoppingItemView: UIImageView!
    
    @IBOutlet weak var shoppingItemLabel: UILabel!

    @IBOutlet weak var addedSwitch: UISwitch!
    
    @IBAction func addItem(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(addedSwitch.isOn, forKey: "addPreferenceKey")
    }
    
}
