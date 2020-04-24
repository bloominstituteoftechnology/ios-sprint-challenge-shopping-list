//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var itemAdded: UIButton!
    
    var shoppingController: ShoppingController?
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }

    

    func updateViews() {
        guard let didAddItem = shoppingList else { return }
        if didAddItem == true {
            nameLabel.text = "Added" } else
        { nameLabel.text = "Not Added"
        }
    }

    
    
}
