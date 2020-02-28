//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let item = item else { return }
        statusLabel.text = item.isOnShoppingList ? "Added" : "Not Added"
        imageView.image = item.image
    }
}
