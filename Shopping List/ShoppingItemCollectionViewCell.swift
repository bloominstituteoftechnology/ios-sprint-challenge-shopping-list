//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let item = item,
            let image = UIImage(data: item.imageData) else { return }
        
        itemImageView.image = image
        itemNameLabel.text = item.name
        
        isInShoppingListLabel.text = item.isInShoppingList ? "ADDED ✓" : "NOT ADDED"
    }
    
    var item: ShoppingItem? { didSet { updateViews() }}
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isInShoppingListLabel: UILabel!

    
    
}

