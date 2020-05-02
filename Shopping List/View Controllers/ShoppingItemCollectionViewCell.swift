//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Bronson Mullens on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addedNotAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        nameLabel.text = item.itemName
        imageView.image = item.itemImage
        
        if item.hasBeenAdded {
            addedNotAddedLabel.text = "Added"
        } else {
            addedNotAddedLabel.text = "Not added"
        }
    }
    
}
