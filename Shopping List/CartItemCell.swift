import Foundation
import UIKit

protocol CartCellDelegate: class
{
	func updateItem(_ item:CartItem, _ new:Bool)
}

class CartItemCell:UICollectionViewCell
{
	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	weak var delegate:CartCellDelegate!

	var modifyingInternally:Bool = false

	func updateViews()
	{
		imgView.image = item.img
		nameLabel.text = isSelected ? "\(item.name) ⭐️" : item.name
		backgroundColor = isSelected ? UIColor(red:0.8, green:0.9, blue:1, alpha:1) : UIColor(named: "White")

	}

	var item:CartItem! {
		didSet {
			isSelected = item.requested
			print("From set item")
			updateViews()
		}
	}

	override var isSelected: Bool {
		didSet {
			print("Selected set to \(isSelected)")
			delegate.updateItem(item, isSelected)
			updateViews()
		}
	}
}

