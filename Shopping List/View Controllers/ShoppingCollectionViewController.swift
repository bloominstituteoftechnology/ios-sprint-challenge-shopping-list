import UIKit

class ShoppingCollectionViewController: UICollectionViewController, ShoppingCollectionViewCellDelegate {
    
    func addButtonWasTapped(on cell: ShoppingCollectionViewCell) {
    
        guard let shopping = cell.shopping, let indexPath = collectionView?.indexPath(for: cell) else { return }
            
            //Update isLiked on the painting
            shoppingController.toggleIsLiked(for: shopping)
            
            //Reload the row
            collectionView?.reloadItems(at: [indexPath])
        }
        
        
        

    
    
    private let reuseIdentifier = "ShoppingCell"
    
    let shoppingController = ShoppingController()
    
    struct PropertyKeys {
        static let paintingDetailSegue = "DetailSegue"
        static let paintingCellIdentifier = "ShoppingCell"
    }
    
    
    
//    func addButtonWasTapped(on cell: ShoppingCollectionViewCell) {
//
//        let location = sender.location(in: self.tableView)
//        guard let indexPath = collectionView.indexPathForRow(at: location), let cell = collectionView.cellForRow(at: indexPath) as? PaintingTableViewCell else { return }
//
//        performSegue(withIdentifier: PropertyKeys.paintingDetailSegue, sender: cell)
//    }
//
//    func likeButtonWasTapped(on cell: ShoppingCollectionViewCell) {
//        //Unwrap the cell's painting and the indexPath of the cell
//        guard let shopping = cell.ImageFoodOutlet, let indexPath = collectionView?.indexPath(for: cell) else { return }
//
//        //Update isLiked on the painting
//        shoppingController.toggleIsLiked(for: shopping)
//
//        //Reload the row
//        collectionView.reloadRows(at: [indexPath], with: .fade)
//    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()

        collectionView?.delegate = self
        collectionView?.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        collectionView?.reloadData()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shopping.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingCollectionViewCell
    
            let shopping = shoppingController.shopping[indexPath.row]
        
        cell.ImageFoodOutlet.image = shopping.image
        cell.foodNameLabel.text = shopping.foodName
       // cell.addOrNotLabel = shopping.addOrNot
    
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
