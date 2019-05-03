//
//  ShoppingItemCollectionCell.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionCell: UICollectionViewCell {
	@IBOutlet var itemImageView: UIImageView!
	
	@IBOutlet var itemLabel: UILabel!
	
	var shoppingItem: ShoppingItem? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		itemImageView.layer.cornerRadius = 15
		guard let item = shoppingItem else { return }
		itemLabel.text = item.imageName.capitalized
		itemImageView.image = UIImage(named: item.imageName)
		itemImageView.alpha = item.inCart ? 1.0 : 0.2
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("touched cell \(itemLabel.text as Any)")
	}
}
