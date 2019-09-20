//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Robert B on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var isListedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let newItem = shoppingItem else { return }
        itemNameLabel.text = newItem.name
        itemImageView.image = UIImage(named: newItem.name)
        
        if newItem.isListed == true {
            isListedLabel.text = "Added"
        } else {
            isListedLabel.text = "Not Added"
        }
    }
    
}
