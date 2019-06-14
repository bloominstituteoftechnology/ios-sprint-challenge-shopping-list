//
//  SHoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SHoppingItemCollectionViewCell: UICollectionViewCell {
	
	override var isSelected: Bool {
		didSet {
			if self.isSelected {
				addedLabel.text = "Added"
			} else {
				addedLabel.text = "Not Yet Added"
			}
		}
	}
	
	@IBOutlet var itemNameLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var addedLabel: UILabel!
	
}
