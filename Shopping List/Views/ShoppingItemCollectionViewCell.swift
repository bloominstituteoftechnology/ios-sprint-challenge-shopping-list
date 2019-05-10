//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        if shoppingItem.addedToList {
            listLabel.text = "Added"
        } else {
            listLabel.text = "Not Added"
        }
        
        shoppingItemImageView.image = UIImage(named: shoppingItem.name)
        
        itemNameLabel.text = shoppingItem.name
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
}
