//
//  ShoppingItemCollectionVCell.swift
//  Shopping List
//
//  Created by Joseph Rogers on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelItemName: UILabel!
    @IBOutlet weak var addedNotAddedLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else {return}
        if item.inShoppingList {
            imageItem.image = UIImage(named: item.image)
            labelItemName.text = "Added \(item.name) to your cart."
            labelItemName.textColor = .red
            addedNotAddedLabel.text = "Added"
            addedNotAddedLabel.textColor = .black
        } else {
            imageItem.image = UIImage(named: item.image)
            labelItemName.text = item.name
            labelItemName.textColor = .black
            addedNotAddedLabel.textColor = .clear
        }
      
    }
}
