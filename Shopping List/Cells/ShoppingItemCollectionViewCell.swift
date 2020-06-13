//
//  FruitsCollectionViewCell.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    var shoppingItem : ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let shoppingItem = shoppingItem else {return}
        itemNameLabel.text = shoppingItem.name
        itemImageView.image = shoppingItem.image
        
        if shoppingItem.added == false {
            addedLabel.text = "Not added"
        } else if shoppingItem.added == true {
            addedLabel.text = "Added"
        }
        
    }
    
}
