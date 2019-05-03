//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

/*
to save : let data = uiimagepngpresentation(image)
to load: let image = UIImge(data: data)

*/

class ShoppingItemCollectionViewCell: UICollectionViewCell {
	private func setupViews() {
		setBackGroundColors()
		setImagesAndText()
	}
	
	func setImagesAndText() {
		guard let item = item, let image = UIImage(data: item.image) else { return }
		
		imageView.image = image
		notAddedLabel.text = item.added ? "Added" : "Not Added"
		itemNameLabel.text = item.name
	}
	
	private func setBackGroundColors() {
		imageView.backgroundColor = .lightGray
		notAddedLabel.backgroundColor = .lightGray
		itemNameLabel.backgroundColor = .lightGray
	}

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var notAddedLabel: UILabel!
	@IBOutlet var itemNameLabel: UILabel!
	
	var item: ShoppingItem? {
		didSet {
			setupViews()
		}
	}
}
