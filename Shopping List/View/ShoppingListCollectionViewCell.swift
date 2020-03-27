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
         
      
         func updateViews() {
             if let item = shoppingItem {
                 imageView.image = UIImage(named: item.name)
                 nameLabel.text = item.name
                 if item.hasBeenAdded { addedLabel.text = "Added"}
                 else { addedLabel.text = "Add" }
             }
         }
         
    
    
    
}
