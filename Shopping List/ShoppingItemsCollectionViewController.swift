import UIKit

private let reuseIdentifier = "shoppingItemCell"

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    var shoppingItems: [ShoppingItem] = []
    
    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemsCollectionViewCell else {return UICollectionViewCell()}
        
        let shoppingItem = shoppingItems[indexPath.item]
        
        cell.shoppingItemView.image = shoppingItem.image
        cell.shoppingItemLabel.text = shoppingItem.name

        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextSegue" {
            guard let memoryDetailViewController = segue.destination as? CustomerViewController else { return }
            memoryDetailViewController.memoryController = memoryController
            
            let memory = memoryController.memories[indexPath.row]
            memoryDetailViewController.memoryController = memoryController
            memoryDetailViewController.memory = memory
        }
    }
}
