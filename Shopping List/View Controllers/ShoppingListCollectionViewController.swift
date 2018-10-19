import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    let reuseIdentifier = "itemCell"
    let newOrderSegueIdentifier = "orderSegue"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderButtonCheck()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return shoppingItemController.addedItems.count
        } else if section == 1 { return shoppingItemController.notAddedItems.count
        } else { return 0 }}
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("No cell!") }
        
        cell.item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        shoppingItemController.update(item: item, isInShoppingList: !item.isInShoppingList)
        orderButtonCheck()
    }
    
    func orderButtonCheck() {
        collectionView?.reloadData()
        collectionView?.setContentOffset(CGPoint.zero, animated: true)
        orderItemsBarButton.isEnabled = shoppingItemController.addedItems.isEmpty ? false : true
    }
    
    @IBOutlet weak var orderItemsBarButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == newOrderSegueIdentifier {
            guard let destination = segue.destination as? OrderItemsViewController else { return }
            destination.shoppingItemController = shoppingItemController
        }
    }
}

