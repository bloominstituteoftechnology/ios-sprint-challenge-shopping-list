//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
	
	
	
	private func setupViews() {
		setBackGroundColors()
		
		guard let item = item else { return }
//		imageView.image = item.image
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
