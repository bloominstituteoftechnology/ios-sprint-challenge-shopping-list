import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    let shoppingCollectionViewController = ShoppingCollectionViewController()
    
    let shoppingController = ShoppingController()
    
    var shopping: Shopping? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shopping = shopping else { return }
        
        ImageFoodOutlet.image = shopping.image
        foodNameLabel.text = shopping.foodName
        print("updateViews on ShoppingCollectionViewCell")
        
        if shopping.addOrNot {
            addOrNotButtonOutlet.setTitle("NotAdded", for: .normal)
            addOrNotButtonOutlet.setTitleColor(UIColor.black, for: .normal)
        } else {
            addOrNotButtonOutlet.setTitle("Added", for: .normal)
            addOrNotButtonOutlet.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    
//    func likeButtonWasTapped(on cell: ShoppingCollectionViewCell) {
//        //Unwrap the cell's painting and the indexPath of the cell
//        guard let shopping = cell.shopping, let indexPath = collectionView.indexPath(for: cell) else { return }
//        
//        //Update isLiked on the painting
//        shoppingController.toggleIsLiked(for: shopping)
//        
//        //Reload the row
//        collectionView.reloadRows(at: [indexPath], with: .fade)
//    }
    
    weak var delegate: ShoppingCollectionViewCellDelegate?
    
    
    @IBAction func addFoodAction(_ sender: UIButton) {
        delegate?.addButtonWasTapped(on: self)
  //      ShoppingCollectionViewController.likeButtonWasTapped(shoppingCollectionViewController)
    }
    
    
    @IBOutlet weak var ImageFoodOutlet: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var addOrNotButtonOutlet: UIButton!
    
    @IBAction func addOrNotAction(_ sender: Any) {
        delegate?.addButtonWasTapped(on: self)
        shoppingCollectionViewController.likeButtonWasTapped(on: self)
    }
}
