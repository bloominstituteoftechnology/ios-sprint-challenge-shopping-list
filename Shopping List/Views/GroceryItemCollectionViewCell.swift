//
//  GroceryItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Bobby Keffury on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var notAddedLabel: UILabel!
    
    
    var shoppingList: ShoppingListController?
    
    var groceryItem: GroceryItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        if let groceryItem = groceryItem {
            itemLabel.text = groceryItem.itemName
            let image = UIImage(named: groceryItem.itemName)
            itemImageView.image = image
            
            if groceryItem.wasAdded == true {
                notAddedLabel.text = "Added"
            } else {
                notAddedLabel.text = "Not Added"
            }
        }
        
    
    }
    
    
    
    
    
    
}
