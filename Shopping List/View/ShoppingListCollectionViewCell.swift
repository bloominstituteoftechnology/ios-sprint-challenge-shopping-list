//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell  {
    
    var shoppingController: ShoppingController?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func updateViews(){
        imageView.image = shoppingList?.Image
        changeLabel()
        
    }
    
    func changeLabel(){
        guard let didAdd = shoppingList?.itemAdded else {return}
        if didAdd == true {
            nameLabel.text = "Added" } else
        { nameLabel.text = "Not Added"
        }
    }
    
    var shoppingList:ShoppingList? {
        didSet {
            updateViews()
        }
    }
}

