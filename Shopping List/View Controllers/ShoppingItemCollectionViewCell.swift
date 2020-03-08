//
//  ShoppingItemCollectionView.swift
//  Shopping List
//
//  Created by Bree Jeune on 2/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: ShoppingItemCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func itemTapped(_ sender: Any) {
        delegate?.ItemTapped(forItem: self)
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem, let image = UIImage(named: shoppingItem.item) else { return }

        var hasBeenAddedText = ""
        if shoppingItem.hasBeenAdded {
            hasBeenAddedText = "Added"
        } else {
            hasBeenAddedText = "Not Added"
        }

        hasBeenAddedLabel.text = hasBeenAddedText
        shoppingItemImage.image = image
        nameLabel.text = shoppingItem.item
    }

    
}



