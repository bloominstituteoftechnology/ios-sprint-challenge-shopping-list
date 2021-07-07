//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Shillingford on 7/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCellDelegate {
    func cellWasTapped()
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    var delegate: ShoppingItemCellDelegate?
    
}
