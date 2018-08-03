//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    var shoppingItem: ShoppingItem?
    var shoppingItemController: ShoppingItemController?
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
}
