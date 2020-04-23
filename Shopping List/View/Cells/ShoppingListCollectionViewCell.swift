//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
@IBOutlet weak var itemAddedLabel: UILabel!
@IBOutlet weak var itemImageView: UIImageView!
@IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let item = shoppingItem {
            itemImageView.image = UIImage(named:item.name)
            itemNameLabel.text = item.name
            
            if item.hasBeenAdded {
                itemAddedLabel.text = "Added"
            } else {
                itemAddedLabel.text = "Not Added"
            }
        }
    }
}
