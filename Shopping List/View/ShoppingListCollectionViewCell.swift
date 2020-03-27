//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    // the planet the cell should display in its views.
    var shoppingList:ShoppingList? {
        didSet {
            // any time the planet's value changes run this code.
            updateViews()
        }
    }
    
    func updateViews() {
        imageView.image =
        nameLabel.text = 
    }
    
}

//Upon selecting the custom cell, the item's Bool value should change from true to false or vice-versa. You can know when a cell has been selected by using the didSelectItemAt method in the UICollectionViewDelegate protocol
