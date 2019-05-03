//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemLable: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemSelectedLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        itemLable.text = shoppingItem.name
        itemImage.image = shoppingItem.image
        
        itemSelectedLabel.text = shoppingItem.hasBeenAdded ? "Added" : "Not Added"
    }
    
}

