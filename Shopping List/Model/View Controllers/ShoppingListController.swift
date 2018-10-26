import UIKit

class ShoppingListController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    let reuseIdentifier = "cell"
    let segueIdentifier = "OrderSegue"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.items.count
        
    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListViewControllerCell else {
//            fatalError("no cell to cast")
            
//            return cell
            
            
        }


//}
    
//}




