//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Paul Yi on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    func itemToggled(on cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
}



