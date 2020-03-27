//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Michael on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
    
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    @IBOutlet weak var addLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    
    
    
    
    
    func updateViews() {
        guard let shoppingList = shoppingList else { return }
        
        itemImageView.image = shoppingList.itemImage
        itemNameLabel.text = shoppingList.itemName
        if shoppingList.itemAdded {
            addLabel.text = "Added"
        } else {
            addLabel.text = "Not Added"
        }
    }
}
