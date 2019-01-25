import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
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
            addOrNotButtonOutlet.setTitleColor(.black, for: .normal)
        } else {
            addOrNotButtonOutlet.setTitle("Added", for: .normal)
            addOrNotButtonOutlet.setTitleColor(.black, for: .normal)
        }
    }
    
    weak var delegate: ShoppingCollectionViewCellDelegate?
    
    @IBAction func addFoodAction(_ sender: UIButton) {
        delegate?.addButtonWasTapped(on: self)
    }
    
    
    @IBOutlet weak var ImageFoodOutlet: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var addOrNotButtonOutlet: UIButton!
    
    @IBAction func addOrNotAction(_ sender: Any) {
        delegate?.addButtonWasTapped(on: self)
    }
}
