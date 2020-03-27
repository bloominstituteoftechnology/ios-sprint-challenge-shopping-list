//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Patrick Millet on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    
    var shoppingItem: ShoppingItem?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabelView: UILabel!
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return}
        
        itemImageView.image = item.fruitImage
        itemLabelView.text = item.name
        
        if item.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
        }
    }
