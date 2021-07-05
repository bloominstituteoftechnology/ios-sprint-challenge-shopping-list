import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingCollectionViewController: UICollectionViewController {
    
    var shop: [Shopping] = []
    
//    var shopping: [Shopping] {
//        let onList = UserDefaults.standard.bool(forKey: "onList")
//        var result = shoppingController.itemNames
//        if onList {
//            result.append(<#T##newElement: String##String#>)
//        }
//    }
    
    let shoppingController = ShoppingController()
    
    //weak var tableView: UITableView?


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingCollectionViewCell
        
        let name = shop[indexPath.row]
        let sho = shop[indexPath.row]
        let isLiked = shop[indexPath.row].like
        
        cell.imageView.image = sho.image
        cell.foodName.text = name.name
       // cell.addOrNot.
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
