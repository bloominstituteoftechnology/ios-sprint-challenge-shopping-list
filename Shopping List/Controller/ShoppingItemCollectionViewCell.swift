//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Samuel Esserman on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

//MARK: - Outlets
    
    @IBOutlet weak var shoppingImage: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let item = shoppingItem {
            shoppingImage.image = item.image
            switch item.hasBeenAdded {
                case true:
                    hasBeenAddedLabel.text = "Added"
                case false:
                    hasBeenAddedLabel.text = "False"
            }
        }
    }
}
