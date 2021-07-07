//
//  GroceryItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var inCartStatusButton: UIButton!
    @IBOutlet weak var groceryItemImage: UIImageView!
    @IBOutlet weak var groceryItemName: UILabel!
    
    
    var groceryItem: GroceryItem?
    var buttonDelegate: GroceryItemCellDelegate?
    
    
    @IBAction func toggleCartStatus(_ sender: UIButton) {
        buttonDelegate?.toggleCartStatus(for: self)
    }
    
}
