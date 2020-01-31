//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Enrique Gongora on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemAdded: UILabel!
    
    var shoppingList: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let shoppingList = shoppingList else { return }
        imageView.image = shoppingList.image
        itemName.text = shoppingList.item
        if shoppingList.addedToList == true {
            itemAdded.text = "Added"
        }else{
            itemAdded.text = "Not Added"
        }
    }
}
