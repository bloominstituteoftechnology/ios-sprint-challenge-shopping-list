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


	override func awakeFromNib() {
		super.awakeFromNib()
		isAddedImageView.image = isAddedImageView.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		isAddedImageView.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
	}

	func updateViews() {
		itemImage.image = item?.image
		nameLabel.text = item?.name
		guard let item = item else { return }
		if item.isAdded {
			animateView(view: isAddedImageView, toHidden: false)
		} else {
			animateView(view: isAddedImageView, toHidden: true)
		}
	}

	private func animateView(view: UIView, toHidden isHidden: Bool) {
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options:[], animations: {
			view.transform = isHidden ? CGAffineTransform(scaleX: 0, y: 0) : CGAffineTransform(scaleX: 1, y: 1)
		}, completion: nil)
	}
}
