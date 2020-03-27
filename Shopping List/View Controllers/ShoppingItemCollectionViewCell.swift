//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet var addedLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    
    // MARK: Properties
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let item = item else { return }
        if item.hasBeenAdded {
            addedLabel.text = .added
        } else {
            addedLabel.text = .notAdded
        }
        itemNameLabel.text = item.itemName
        itemImageView.image = item.itemImage
    }
    
}
