//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Madison Waters on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class{
    func itemAddedWasTapped(on cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemAddedButton: UIButton!
    
    @IBAction func itemAddedToggle(_ sender: Any) {
        
        delegate?.itemAddedWasTapped(on: self)
    }
    
    func updateViews () {
        
        guard let shoppingItem = shoppingItem else { return }
        let itemAddedTitle = shoppingItem.wasAdded ? "Added" : "Add"
        itemAddedButton.setTitle(itemAddedTitle, for: .normal)
        
        // Add items to shopping items array
        
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
 
    
}

//    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
//
//    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
//    }
