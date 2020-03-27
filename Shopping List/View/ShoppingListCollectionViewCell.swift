//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
             didSet{
                 updateViews()
             }
         }
         
    
         @IBOutlet weak var nameLabel: UILabel!
         @IBOutlet weak var imageView: UIImageView!
         @IBOutlet weak var addedLabel: UILabel!
         
      
  
    private func updateViews() {
        guard let item = shoppingItem,
            imageView.image == UIImage(named: item.name),
            nameLabel.text == item.name else { return }
        
        if item.hasBeenAdded == false {
            addedLabel.text = "Add"
        } else {
            addedLabel.text = "Added"
        }
    }
}
         
    
    
    

