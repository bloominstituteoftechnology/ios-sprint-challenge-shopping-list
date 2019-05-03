//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
	
	var shoppingListController : ShoppingListController?
	
	override var isSelected: Bool{
		didSet{
		}
	}
	
//	override var isSelected: Bool{
//		didSet{
//		}
//	}
	
	
	
//	var item: Item? {
//		didSet {
//			updateViews()
//		}
//	}
//
//	func updateViews() {
//		guard let item = item else { return }
//		imageView.image = UIImage
//		label.text = item.name
//
//	}

	
	@IBOutlet weak var addedLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var label: UILabel!
}
