//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingController: ShoppingItemController?
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
}
