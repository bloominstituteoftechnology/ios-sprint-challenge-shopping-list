//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
//    let itemController = ItemController()
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var notButton: UIButton!
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBAction func notButtonPressed(_ sender: Any) {
        if notButton.isHidden {
        notButton.isHidden = false
        
            
        } else if !notButton.isHidden {
            notButton.isHidden = true
            ItemController.init().removeShoppingItem()
        }
    }
    
}
