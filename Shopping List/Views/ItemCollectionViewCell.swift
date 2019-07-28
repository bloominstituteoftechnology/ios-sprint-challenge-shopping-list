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
        
//        cell.itemName.text = item.name
//        
//        if cell.itemName.text == String.apple {
//            cell.itemImage.image = UIImage(named: String.apple)
//        } else if cell.itemName.text == String.grapes {
//            cell.itemImage.image = UIImage(named: String.grapes)
//        } else if cell.itemName.text == String.milk {
//            cell.itemImage.image = UIImage(named: String.milk)
//        } else if cell.itemName.text == String.muffin {
//            cell.itemImage.image = UIImage(named: String.muffin)
//        } else if cell.itemName.text == String.popcorn {
//            cell.itemImage.image = UIImage(named: String.popcorn)
//        } else if cell.itemName.text == String.soda {
//            cell.itemImage.image = UIImage(named: String.soda)
//        } else if cell.itemName.text == String.strawberreis {
//            cell.itemImage.image = UIImage(named: String.strawberreis)
//        }
//        
        
        guard let itemName = itemNameLabel.text else {return}
        if item.hasBeenAdded == false {
            addedLabel.text = String("Add \(itemName)")
        } else {
            addedLabel.text = String("\(itemName) is in your cart.")
        }
    }
}
