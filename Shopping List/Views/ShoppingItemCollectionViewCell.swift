//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dennis Rudolph on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    // Methods
    
    func updateViews() {
        guard let item = shoppingItem else { return }
        nameLabel.text = item.name
        
        if item.added {
            notAddedLabel.text = "Added"
        } else {
            notAddedLabel.text = "Not Added"
        }
        itemImageView.image = UIImage(named: item.name)
    }
}
