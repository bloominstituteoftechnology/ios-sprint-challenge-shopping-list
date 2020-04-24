//
//  ShoppingItemViewCell.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemViewCell: UICollectionViewCell {
    @IBOutlet var itemImage: UIButton?
    @IBOutlet var itemName: UILabel?
    @IBOutlet var itemAdded: UILabel?
    
    var delegate: ShoppingItemViewCellDelegate?
    
    @IBAction func imagePressed(_ sender: UIButton) {
        delegate?.toggleAddToCart(for: self)
    }

    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        if let unwrappedItem = item {
            itemName?.text = unwrappedItem.name
            itemAdded?.text = (unwrappedItem.isAddedToShoppingList ? "Added" : "Not Added")
            itemImage?.setImage(unwrappedItem.itemImage, for: .normal)
        }
    }
}
