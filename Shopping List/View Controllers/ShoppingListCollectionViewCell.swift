//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Rob Vance on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // Mark: IBOutlets
    @IBOutlet weak var itemAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingController: ShoppingController?
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let shoppingList = shoppingList else { return }
        imageView.image = UIImage(named: shoppingList.itemName)
        itemNameLabel.text = shoppingList.itemName
        
        if shoppingList.addedItem == false {
            itemAddedLabel.text = "Not Added"
        } else {
            itemAddedLabel.text = "Added"
        }
    }
}
