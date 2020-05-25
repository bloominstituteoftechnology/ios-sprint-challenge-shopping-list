//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItemController = ShoppingItemController()
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
   
    func udateViews() {

    }
}
