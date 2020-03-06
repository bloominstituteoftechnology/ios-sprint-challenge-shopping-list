//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
             didSet {
                 updateViews()
             }
         }
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var notAddedLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
       
      
       
       private func updateViews() {
           guard let item = item else { return }
           
           imageView.image = item.image
           item.hasBeenAdded = !item.hasBeenAdded
           
           if item.hasBeenAdded == true {
               notAddedLabel.text = "Not Added"
           } else {
               notAddedLabel.text = "Added"
           }
           
       }
}
