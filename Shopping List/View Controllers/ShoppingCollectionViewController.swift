import UIKit

class ShoppingCollectionViewController: UICollectionViewController {

    // MARK: - Properties

    var shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    // Number of items in collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }

    // Configurin cell for each item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell()}

        let shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        
        cell.itemAddedBool.text = itemBoomString(added: shoppingItem.hasBeenAdded)
        cell.itemName.text = shoppingItem.itemName
        cell.itemImage.image = UIImage(named: shoppingItem.itemName)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        
        shoppingItem.hasBeenAdded.toggle()
        #warning("Collection View not reloaded")
    }
    
}



    // MARK: - Extensions

// Converts Bool to String for Custom Cell
extension ShoppingCollectionViewController {
    func itemBoomString(added: Bool) -> String {
        if added {
            return "Added"
        } else {
            return "Not Added"
        }
    }
}
