import UIKit

class ShoppingListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let shoppingItemController = ShoppingItemController()
    let reuseIdentifier = "cell"
    let segueIdentifier = "OrderSegue"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        collectionView?.backgroundColor = UIColor.yellow
 
    }
    
    func checkIfLaunched() {
        let hasLaunched = UserDefaults.standard.bool(forKey: "hasLaunched")
        
        if !hasLaunched {
            loadView()
            UserDefaults.standard.set(true, forKey: "hasLaunched")
        } else {
            shoppingItemController.loadFromPersistence()
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        as! ShoppingListViewControllerCell
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.layer.borderWidth = 1
        cell.backgroundColor = UIColor.blue
        cell.item = shoppingItem
            
            return cell
            
            
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
    }
    


}
    





