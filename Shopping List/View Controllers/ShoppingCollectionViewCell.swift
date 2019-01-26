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

        print("updateViews on ShoppingCollectionViewCell")

        if shopping.addOrNot == true {
            addOrNotButtonOutlet.setTitle("NotAdded", for: .normal)
  //          addOrNotButtonOutlet.setTitleColor(UIColor.black, for: .normal)
        } else if shopping.addOrNot == false {
            addOrNotButtonOutlet.setTitle("Added", for: .normal)
   //         addOrNotButtonOutlet.setTitleColor(UIColor.black, for: .normal)
        }
    }

    
    weak var delegate: ShoppingCollectionViewCellDelegate?
    
    @IBOutlet weak var ImageFoodOutlet: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var addOrNotButtonOutlet: UIButton!
    
    @IBAction func addOrNotAction(_ sender: Any) {
        delegate?.addButtonWasTapped(on: self)
 //       shoppingCollectionViewController.addButtonWasTapped(on: self)
  //      ShoppingController.toggleIsLiked(on: self)
        print("like button pressed")
        
    }
}
