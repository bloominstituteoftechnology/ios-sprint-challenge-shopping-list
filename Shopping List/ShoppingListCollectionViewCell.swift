//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

extension String{
    
    static var isAddedToListKey = "IsAddedToList"
}

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // Properties
    
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    
    //  Outletes
    
    @IBOutlet weak var addedToShoppingListLabel: UILabel!
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    
    @IBOutlet weak var shoppingItemDescription: UILabel!
    
    // Methods
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        shoppingItemImage.image = shoppingItem.image
        shoppingItemDescription.text = shoppingItem.imageName
        shoppingItem.hasBeenAddedToList = UserDefaults.standard.bool(forKey: .isAddedToListKey)
        if shoppingItem.hasBeenAddedToList{
            addedToShoppingListLabel.text = ""
        }
        addedToShoppingListLabel.text = "Add to List"
    }
}
