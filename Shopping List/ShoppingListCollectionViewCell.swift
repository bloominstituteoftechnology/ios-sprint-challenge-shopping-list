//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // Mark: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shoppingLabel: UILabel!
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
    var shoppinglist: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
        
        private func updateViews() {
            guard let shoppinglist = shoppinglist else { return }
            
            shoppingLabel.text = shoppinglist.name
            imageView.image = shoppinglist.picture
            
            if shoppinglist.addedOnTheShoppingList {
                isAddedLabel.text = "Added"
            } else {
                isAddedLabel.text = "Not Added"
            }
        }
    
    
    }
    

