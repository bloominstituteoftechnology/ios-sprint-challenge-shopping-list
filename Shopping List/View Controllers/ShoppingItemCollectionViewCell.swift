//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    func updateViews() {
//        shoppingItemImage.image = shoppingItem?.image
        shoppingItemLabel.text = shoppingItem?.name
    }
}
