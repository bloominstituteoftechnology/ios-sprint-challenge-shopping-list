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
        guard let item = item,
            let image = UIImage(data: item.image) else { return }
        
        shoppingItemImageView.image = image
        shoppingItemLabel.text = item.name
        addedItemLabel.text = item.isInList ? "In Cart" : ""
    }
    
    
    
    
    
    
}
