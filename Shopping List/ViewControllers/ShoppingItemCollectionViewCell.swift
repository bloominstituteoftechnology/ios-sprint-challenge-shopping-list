//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Rick Wolter on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
           }
        }
    
    @IBOutlet weak var addedItemLabel: UILabel!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    
     func updateViews() {
        guard let item = item else { return }
        
        
        
        
        shoppingItemImageView.image = UIImage(data: item.image)
        shoppingItemLabel.text = item.name
        if item.isInList == true {
            addedItemLabel.text = "Added"
        } else {
            addedItemLabel.text = "Not Added"
        }
        
    }
}
