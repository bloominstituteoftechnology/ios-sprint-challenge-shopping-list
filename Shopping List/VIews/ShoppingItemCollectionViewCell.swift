//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
        didSet {
            if self.isSelected {
                updateViews()
            }
        }
    }
    var shoppingItemController = ShoppingItemController()
    
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    
    
    func updateViews() {
        guard let item = item else { return }
        switch item.added {
        case true: hasBeenAddedLabel.text = "Added"
        default:
            hasBeenAddedLabel.text = "Not Added"
        }
    }
}
