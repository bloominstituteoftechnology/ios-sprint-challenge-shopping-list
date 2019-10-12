//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Thompson on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItems? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let newItem = shoppingItem else { return }
        itemNameLabel.text = newItem.name
        itemImage.image = UIImage(named: newItem.name)
        
        if newItem.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
    }
    
    
    
}
