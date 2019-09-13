//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Madison Waters on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!

    func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        itemNameLabel.text = shoppingItem.itemName
        itemAddedLabel.text = shoppingItem.wasAdded ? "Remove" : "Add"
        itemImageView.image = shoppingItem.image
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
}


