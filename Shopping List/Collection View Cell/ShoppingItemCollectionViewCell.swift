//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ItemCollectionViewCellDelegate: AnyObject {
	func buttonImageWasPressed(on Cell: UICollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
	
	weak var delegate: ItemCollectionViewCellDelegate?
	
	var shoppingItem: ShoppingItem? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet weak var wasAddedLabel: UILabel!
	@IBOutlet weak var itemButtonImage: UIButton!
	@IBOutlet weak var itemNameLabel: UILabel!
	
	@IBAction func itemButtonPressed(_ sender: UIButton) {
		delegate?.buttonImageWasPressed(on: self)
	}
	
	func updateViews() {
		guard let newItem = shoppingItem else { return }
		let text = newItem.hasBeenAdded ? "Added" : "Not Added"
		wasAddedLabel.text = text
		itemNameLabel.text = newItem.item
		
		let imageName = newItem.imageName
		guard let image = UIImage(named: imageName) else { return }
		itemButtonImage.setImage(image, for: .normal)
	}
	
}
