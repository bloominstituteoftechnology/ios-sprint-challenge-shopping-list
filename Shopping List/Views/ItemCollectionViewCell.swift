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
    @IBOutlet weak var hasBeenAdded: UIButton!
    
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            
            
            
        }
    }
    
    func updateViews() {
        
        itemImage.image = shoppingItem?.image
        itemNameLabel.text = shoppingItem?.itemName
        hasBeenAdded.setTitle("Not Added", for: .normal)
        
    }
    
}
