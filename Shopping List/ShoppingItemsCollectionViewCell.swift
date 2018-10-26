import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        updateViews()
//    }
//    private func updateViews() {
//        let userDefaults = UserDefaults.standard
//        isAdded.isOn = userDefaults.bool(forKey: .isAddedKey)
//    }
    

    @IBOutlet weak var shoppingItemView: UIImageView!
    
    @IBOutlet weak var shoppingItemLabel: UILabel!


}
