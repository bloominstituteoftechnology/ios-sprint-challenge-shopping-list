//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var addedOrNotAdded: UILabel!
    
    
    var delegate: ItemDelegate?
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
           updateViews()
        }
    }
    
    
    func updateViews() {
        
        itemImage.image = shoppingItem?.image
        itemNameLabel.text = shoppingItem?.itemName
        
        switch shoppingItem?.itemHasBeenAdded {
        case true:
            addedOrNotAdded.text = "Added"
        default:
            addedOrNotAdded.text = "Not Added"
        }
        
    }
    
}
