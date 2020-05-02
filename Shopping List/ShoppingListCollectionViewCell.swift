//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var shoppingListImage: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var shoppingItems: ShoppingItems? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let items = shoppingItems else { return }
        hasBeenAddedLabel.text = items.hasBeenAdded ? "Added" : "Not Added"
        nameLabel.text = items.name
        shoppingListImage.image = items.image
    }
}
