//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Shawn James on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isAddedLabel: UILabel!
    
    
    // MARK: - ShoppingItem Property
    
    var shoppingItem: ShoppingItem? { didSet { updateViews() } }
    
    
    // MARK: - Update views method
    
    func updateViews() {
        if let shoppingItem = shoppingItem {
            imageView.image = UIImage(named: shoppingItem.name)
            nameLabel.text = shoppingItem.name
            if shoppingItem.isAdded { isAddedLabel.text = "Added" } else { isAddedLabel.text = "+ Add" }
        }
    }
    
}

