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


	override var isSelected: Bool {
		didSet {
			if self.isSelected {
				addedLabel.text = "Added"
			} else {
				addedLabel.text = "Not Yet Added"
			}
		}
	}
}
