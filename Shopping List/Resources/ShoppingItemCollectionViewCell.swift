//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by scott harris on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let shoppingItem = shoppingItem {
            shoppingItemImageView.image = shoppingItem.image
            switch shoppingItem.hasBeenAdded {
                case true:
                    hasBeenAddedLabel.text = "Added"
                case false:
                    hasBeenAddedLabel.text = "Not Added"
            }

        }
        
    }
    
}
