import UIKit

class ShoppingCollectionViewController: UICollectionViewController , ShoppingCollectionViewCellDelegate {
    
    var shopping: Shopping?
    
    
    
    func addButtonWasTapped(on cell: ShoppingCollectionViewCell) {
        
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }


        let shoppingItem = shoppingController.shopping[indexPath.row]



            //Update isLiked on the painting
            shoppingController.toggleIsLiked(for: shoppingItem)
        
        cell.addOrNotButtonOutlet.alpha = shoppingController.shopping[indexPath.row].addOrNot ? 1.0 : 0.33

            //Reload the row
            collectionView?.reloadItems(at: [indexPath])
            collectionView?.reloadData()
        
        
        }
    
    
    
    private let reuseIdentifier = "ShoppingCell"
    
    let shoppingController = ShoppingController()
    
    struct PropertyKeys {
        static let paintingDetailSegue = "DetailSegue"
        static let paintingCellIdentifier = "ShoppingCell"
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }
    
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shopping.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingCollectionViewCell
        
        cell.delegate = self
    
        let shopping = shoppingController.shopping[indexPath.row]
        
  //      let title = "what added"
        
        cell.ImageFoodOutlet.image = UIImage(named: shopping.foodName)
        
        cell.foodNameLabel.text = shopping.foodName
        
     //   cell.addOrNotButtonOutlet?.setTitle(title, for: .normal)
        cell.addOrNotButtonOutlet.alpha = shoppingController.shopping[indexPath.row].addOrNot ? 1.0 : 0.33
    
        return cell
    }


}
