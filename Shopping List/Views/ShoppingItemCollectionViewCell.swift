//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jonalynn Masters on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var selectedItems = 0
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let selectedItem = shoppingItem {
            itemNameLabel.text = selectedItem.itemName
            imageView.image = selectedItem.image
            switch selectedItem.hasBeenAdded {
            case true:
                addedLabel.text = "Added"
            case false:
                addedLabel.text = "Not yet added"
            }
        } else {
            return
        }
        
        
    }
    
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addedLabel: UILabel!
    
}
