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
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else { return }
        if item.inShoppingList {
            imageItem.image = UIImage(named: item.selectedImage)
        } else {
            imageItem.image = UIImage(named: item.image)
        }
        labelItemName.text = item.name
    }
}
