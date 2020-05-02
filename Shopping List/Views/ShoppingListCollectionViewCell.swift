//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by David Wright on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties

    var shoppingItem: ShoppingItem? {
        didSet { updateViews() }
    }
        
    // MARK: IBOutlets

    @IBOutlet weak var isOnShoppingListLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Methods
    
    func updateViews() {
        guard let item = shoppingItem else { return }
        isOnShoppingListLabel.text = item.isOnShoppingList ? "Added" : "Not Added"
        itemNameLabel.text = item.name
        imageView.image = UIImage(named: item.name)
    }
    
}
