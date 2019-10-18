//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        itemName.text = shoppingItem.itemName
        itemImage.image = UIImage(data: shoppingItem.imageData)
    
        if shoppingItem.added {
            addedLabel.text = "Remove Item"
        } else {
            addedLabel.text = "Add Item"
        }
    }
}
