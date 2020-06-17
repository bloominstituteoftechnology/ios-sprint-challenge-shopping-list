//
//  ShoppingListViewCell.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var itemInCart: ShoppingList? {
         didSet {
            updateViews()
         }
     }
  
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var addedLabel: UILabel!
    
    private func updateViews() {
        guard let itemInCart = itemInCart else { return }
        itemImage.image = UIImage(named: itemInCart.image)
        itemLabel.text = itemInCart.name
        
        if itemInCart.itemAdded {
            addedLabel.text = "Added"
            print(itemInCart.itemAdded)
        } else {
            addedLabel.text = "Not Added"
            print(itemInCart.itemAdded)
        }
    }
    
    
}
