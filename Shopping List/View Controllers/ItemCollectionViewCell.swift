//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Shillingford on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
protocol AddedDelegate {
    func hasBeenAddedValueChanged()
}


class ItemCollectionViewCell: UICollectionViewCell {
    
    var delegate = AddedDelegate?.self
    
    var shoppingList = ShoppingList()
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
}
