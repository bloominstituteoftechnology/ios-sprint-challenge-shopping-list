//
//  SHoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
	
	var selectedItems = 0
	
	var shoppingItem: ShoppingItem? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		if let selectedItem = shoppingItem {
			selectedItem.hasBeenAdded = !selectedItem.hasBeenAdded
			switch selectedItem.hasBeenAdded {
			case true:
				addedLabel.text = "Added"
			case false:
				addedLabel.text = "Not yet added"
			}
		} else {
			return
		}
		
		
	}
	
	@IBOutlet var itemNameLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var addedLabel: UILabel!
	
}
