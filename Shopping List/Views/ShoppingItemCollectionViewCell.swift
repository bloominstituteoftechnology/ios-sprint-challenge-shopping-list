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
        
        guard let shoppingItem = shoppingItem,
            let image = UIImage(named: shoppingItem.itemName)
            else { return }
        
        addedLabel.text = shoppingItem.isAdded ? "Added" : "Not Added"
        itemName.text = shoppingItem.itemName
        itemImage.image = image
    }
    
}
