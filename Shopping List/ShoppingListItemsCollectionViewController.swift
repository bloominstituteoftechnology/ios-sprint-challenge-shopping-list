import UIKit

class ShoppingListItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    
    // need to give images corrosponding names
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ShoppingItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        // IMPORTANT
        collectionView.allowsMultipleSelection = true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    
    
//    IMPORTANT
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("Inconsistent view state")
        }

        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        if shoppingItem.isAdded == true {
            cell.addLabel.text = "Added"
        } else {
            cell.addLabel.text = "Not Added"
        }
        
        cell.shoppingItemName.text = shoppingItem.name
        cell.shoppingItemImage.image = UIImage(named: shoppingItem.name)

        return cell

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        let amount: CGFloat = 32
        
        layout.sectionInset = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
        
        collectionView.reloadData()
    }
    
    
    // IMPORTANT
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItem.isAdded = true
    }
    
    
    // IMPORTANT
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItem.isAdded = false
    }
    
    
    //need segue
    
}
