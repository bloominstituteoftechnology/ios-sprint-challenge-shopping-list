//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingItemNameLabel.text = shoppingItem.itemName
        shoppingItemImageView.image = shoppingItem.image
        
        if shoppingItem.added == false {
            addedLabel.text = "Not Added"
        } else {
            addedLabel.text = "Added"
        }
    }
    
}
