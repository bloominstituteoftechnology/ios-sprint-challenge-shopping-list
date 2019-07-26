//
//  ItemCell.swift
//  Shopping List
//
//  Created by Jeffrey Santana on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
	@IBOutlet weak var inCartLbl: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLbl: UILabel!
	
	var item: Item? {
		didSet {
			configCell()
		}
	}
	
	private func configCell() {
		guard let item = item, let image = item.getImage() else { return }
		
		inCartLbl.text = item.isInCart ? "Added" : "Not Added"
		imageView.image = image
		nameLbl.text = item.name
	}
}
