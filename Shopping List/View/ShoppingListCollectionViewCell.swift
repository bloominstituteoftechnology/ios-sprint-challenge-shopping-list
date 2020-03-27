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
    
    
    var shoppingList:ShoppingList? {
        didSet {
            updateViews()
        }
    }
    
    
    
    func updateViews(){
        imageView.image = shoppingList?.image
        nameLabel.text = shoppingList?.itemName
    }
    
}

//Upon selecting the custom cell, the item's Bool value should change from true to false or vice-versa. You can know when a cell has been selected by using the didSelectItemAt method in the UICollectionViewDelegate protocol
