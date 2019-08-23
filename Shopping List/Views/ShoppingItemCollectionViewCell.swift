//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jordan Christensen on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        //TODO: update view
    }
    
}
