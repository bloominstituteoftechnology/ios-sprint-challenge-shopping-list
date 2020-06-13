//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Norlan Tibanear on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let shoppingItem = shoppingItem else { return }
        
        nameLabel.text = shoppingItem.itemName
        imageView.image = shoppingItem.itemImage
        
        if shoppingItem.hasBeenAdded == true {
            addedLabel.text = "Added"
        } else {
            addedLabel.text = "Not Added"
        }
    }
    
    
}
