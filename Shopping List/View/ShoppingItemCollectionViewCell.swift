//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
   
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet var addToCartLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemNameLabel: UILabel!
    
    
    func updateViews() {
        if let item = item {
            itemImageView.image = item.image
            itemNameLabel.text = item.name

            if item.addedToShoppingList {
                addToCartLabel.text = "Added"
            } else {
                addToCartLabel.text = "Not added"
            }
        }
    }
}
