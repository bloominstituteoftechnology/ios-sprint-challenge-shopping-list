//
//  ListOfItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ListOfItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    
    @IBOutlet weak var addedLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }

    func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        shoppingItemNameLabel.text = shoppingItem.nameOfItem
        shoppingItemImage.image = shoppingItem.image
        addedLabel.text = shoppingItem.addedToList ? "Added" : "Not Added"
        
        
    }
}
