import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingItemCollectionViewCellDelegate {
    func itemToggled(on cell: ShoppingItemCollectionViewCell) {
        guard let index = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = shoppingItemController.shoppingItems[index.item]
        shoppingItemController.toggleIsAdded(shoppingItem: shoppingItem)
        collectionView?.reloadData()
    }

    override func viewDidLoad() {
        <#code#>
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        cell.shoppingItem = shoppingItemController.shoppingItems[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
    
    
    
    
    
    let shoppingItemController = ShoppingItemController()
    let localNotificationHelper = LocalNotificationHelper()
    
}
