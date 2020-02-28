//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemAddedLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!

    var shoppingItem: ShoppingItem {
        didSet {
            updateViews()
        }
    }
    
    func udpateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        itemImage.image = shoppingItem.image
        itemAddedLabel.text = shoppingItem.itemAdded
        itemNameLabel.text = shoppingItem.
        
    }
}
