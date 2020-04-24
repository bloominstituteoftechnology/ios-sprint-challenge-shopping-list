//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    
    
   
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var shoppingItemName: UILabel!
    @IBOutlet weak var addedOrNotLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            
            updateViews()
            
        }
    }
    
    func updateViews() {
        
//        shoppingItemName.text = shoppingItem?.name
//
//        if let shoppingItem = shoppingItem {
//
//            itemImageView.image = shoppingItem.image
//
//            switch shoppingItem.isAdded {
//
//            case true:
//
//                addedOrNotLabel.text = "Added"
//
//            case false:
//
//                addedOrNotLabel.text = "Not Added"
//            }
//        }
        
        
        
        
        
        if shoppingItem?.isAdded == true
               {
                   addedOrNotLabel.text = "Added"
               } else {
                   addedOrNotLabel.text = "Not Added"
               }

               itemImageView.image = shoppingItem?.image
           }
    }

