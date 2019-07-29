//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let item = item else {return}
        itemNameLabel.text = item.name
        
        itemNameLabel.text = item.name
        
        if itemNameLabel.text == String.apple {
            itemImageView.image = UIImage(named: String.apple)
        } else if itemNameLabel.text == String.grapes {
            itemImageView.image = UIImage(named: String.grapes)
        } else if itemNameLabel.text == String.milk {
            itemImageView.image = UIImage(named: String.milk)
        } else if itemNameLabel.text == String.muffin {
            itemImageView.image = UIImage(named: String.muffin)
        } else if itemNameLabel.text == String.popcorn {
            itemImageView.image = UIImage(named: String.popcorn)
        } else if itemNameLabel.text == String.soda {
           itemImageView.image = UIImage(named: String.soda)
        } else if itemNameLabel.text == String.strawberreis {
            itemImageView.image = UIImage(named: String.strawberreis)
        }
        
        
        guard let itemName = itemNameLabel.text else {return}
        if item.hasBeenAdded == false {
            addedLabel.text = String("Add \(itemName)")
        } else {
            addedLabel.text = String("\(itemName) is in your cart.")
        }
    }
}
