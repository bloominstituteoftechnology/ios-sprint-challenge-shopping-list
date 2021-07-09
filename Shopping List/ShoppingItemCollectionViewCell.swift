//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var addedToCartLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        itemNameLabel.text = shoppingItem.name
        itemImageView.image = UIImage(data: shoppingItem.imageData)
        
        addedToCartLabel.text = shoppingItem.isInCart ? "Added" : "Not Added"
    }
    
}
