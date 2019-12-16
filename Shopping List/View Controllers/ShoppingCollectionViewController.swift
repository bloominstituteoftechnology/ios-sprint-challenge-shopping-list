import UIKit

class ShoppingCollectionViewController: UICollectionViewController {

    
    // MARK: - Properties

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
      
    // MARK: UICollectionViewDataSource

    // Number of items in collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }

    // Configuring cell for each item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell()}

        cell.shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        
        return cell
    }
    
    
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingListController.updateItem(indexPath: indexPath)
        self.collectionView.reloadData()
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
