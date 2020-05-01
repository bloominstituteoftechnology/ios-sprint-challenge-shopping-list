//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var itemAdded: UILabel!
    
    var shoppingController: ShoppingController?
    
    var shoppingList: ShoppingList? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingList = shoppingList else { return }
        imageView.image = UIImage(named: shoppingList.itemName)
        nameLabel.text = shoppingList.itemName
        
        if shoppingList.addedItem == false {
            itemAdded.text = "Add"
        } else {
            itemAdded.text = "Added"
        }
        
        
    }
}


