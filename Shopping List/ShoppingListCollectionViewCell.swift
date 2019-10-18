//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addedToCartLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        addedToCartLabel.text = shoppingItem.addedToShoppingList ? "Added to cart" : "Not Added"
        itemNameLabel.text = shoppingItem.itemName
        itemImageView.image = UIImage(named: shoppingItem.itemName)        
    }
}
