//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Vijay Das on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ItemCell"
    
    @IBOutlet weak var isAddedButton: UIButton!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBAction func tappedIsAdded(_ sender: UIButton) {
        
        delegate?.tapIsAddedButton(on: self)
    }
    
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    
    
}
