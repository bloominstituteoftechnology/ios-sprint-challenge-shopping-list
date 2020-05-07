//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addItemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppinglistController: ShoppingListController?
    
    var shoppingList: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingList = shoppingList else { return }
        
        itemImageView.image = UIImage(named: shoppingList.name)
        itemNameLabel.text = shoppingList.name
        
        if shoppingList.hasBeenAdded == false {
            addItemLabel.text = "Not Added"
        } else {
            addItemLabel.text = "Added"
        }
    }
    
}
