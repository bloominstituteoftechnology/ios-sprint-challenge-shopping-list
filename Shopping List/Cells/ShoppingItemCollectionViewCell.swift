//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let item = item,
              let image = UIImage(data: item.imageData) else { return }
        
        itemImageView.image = image
        itemNameLabel.text = item.name
        
        isInShoppingListLabel.text = item.isInShoppingList ? "ADDED ✓" : "NOT ADDED"
        isInShoppingListLabel.textColor = item.isInShoppingList ? .orange : .lightGray
    }
    
    var item: ShoppingItem? { didSet { updateViews() }}
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isInShoppingListLabel: UILabel!
    
}
