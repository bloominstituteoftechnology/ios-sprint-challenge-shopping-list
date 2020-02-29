
import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemModelController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.toggleItemAdded(item: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
        
    // This link is where I got started down this path. https://stackoverflow.com/questions/48612109/add-a-tap-event-to-collectionviewcell-while-passing-cell-data
    }
        
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let orderVC = segue.destination as? OrderViewController else { return }
        orderVC.itemCount = shoppingItemController.shoppingList.filter( {$0.wasAdded} ).count
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        return cell
    }
    
    // MARK: UICollectionViewDelegate
}
