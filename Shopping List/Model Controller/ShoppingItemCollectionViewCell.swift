//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var shoppingItemName: UILabel!
    @IBOutlet weak var addedOrNotLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        itemImageView.image = itemImageView?.image
        shoppingItemName.text = shoppingItem?.name
        addedOrNotLabel.isEnabled = false
    }
    
    
}
