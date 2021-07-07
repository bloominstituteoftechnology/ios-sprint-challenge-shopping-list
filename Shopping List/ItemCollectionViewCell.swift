//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ItemCollectionViewCellDelegate: AnyObject {
	func buttonImageWasPressed(on Cell: UICollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
	
	
	weak var delegate: ItemCollectionViewCellDelegate?
	var shoppingItem: Item? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet weak var addedLabel: UILabel!
	@IBOutlet weak var buttonImage: UIButton!
	@IBOutlet weak var label: UILabel!
	
	@IBAction func buttonPressed(_ sender: UIButton) {
		delegate?.buttonImageWasPressed(on: self)
	}
	
	func updateViews(){
		guard let newItem = shoppingItem else { return }
		let text = newItem.added ? "Added" : "Not Added"
		addedLabel.text = text
		label.text = newItem.name
		
		
		let imageName = newItem.imageName
		guard let image = UIImage(named: imageName) else { return }
		buttonImage.setImage(image, for: .normal)
	}
	
	
}

