import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    var shopping: Shopping? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        //Make sure there is a painting
        guard let shopping = shopping else { return }
        
        //Set the image view's image to the painting's image
        ImageFoodOutlet.image = shopping.image
        
        //Update Like button
        if shopping.addOrNot {
            addOrNotButtonOutlet.setTitle("NotAdded", for: .normal)
            addOrNotButtonOutlet.setTitleColor(.black, for: .normal)
        } else {
            addOrNotButtonOutlet.setTitle("Added", for: .normal)
            addOrNotButtonOutlet.setTitleColor(.black, for: .normal)
        }
    }
    
    weak var delegate: ShoppingCollectionViewCellDelegate?
    
    //Call Delegate's likeButtonWasTapped method when the Like button is tapped.
    @IBAction func addFoodAction(_ sender: UIButton) {
        delegate?.addButtonWasTapped(on: self)
    }
    
    
    @IBOutlet weak var ImageFoodOutlet: UIImageView!
    @IBOutlet weak var addOrNotLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var addOrNotButtonOutlet: UIButton!
    
    @IBAction func addOrNotAction(_ sender: Any) {
    }
}
