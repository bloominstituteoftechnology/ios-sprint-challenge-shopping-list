//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marlon Raskin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

	var item: ShoppingItem? {
		didSet {
			updateViews()
		}
	}

	@IBOutlet weak var itemImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var isAddedImageView: UIImageView!
	

	func updateViews() {
		itemImage.image = item?.image
		nameLabel.text = item?.name
	}
}
