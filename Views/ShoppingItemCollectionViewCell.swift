//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var itemNameLabel: UILabel!
	@IBOutlet weak var addedLabel: UILabel!


	//var selectedItems = 0

	var shoppingItem: ShoppingItem? {
		didSet {
			updateViews()
		}
	}


	func updateViews() {
		if let shoppingItem = shoppingItem {
			itemNameLabel.text = shoppingItem.itemName
			imageView.image = shoppingItem.image
			switch shoppingItem.hasBeenAdded {
			case true:
				addedLabel.text = "Added"
			case false:
				addedLabel.text = "Not yet added"
			}
		} else {
			return
		}


	}
}
