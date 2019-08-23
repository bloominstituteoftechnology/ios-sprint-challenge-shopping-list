//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Ciara Beitel on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var addToListLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        addToListLabel.isEnabled = shoppingItem.addedToList
        itemNameLabel.text = shoppingItem.itemName
        imageView.image = UIImage(named: shoppingItem.image)
    }
    
}
