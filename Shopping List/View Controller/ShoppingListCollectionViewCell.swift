//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewCell: UICollectionViewCell {
    

    var shoppingItem: Item?{
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func updateView(){
        if let shoppingItem = shoppingItem{
            imageCell.image = UIImage(data: shoppingItem.image)
            nameLabel.text = shoppingItem.name
           let status = shoppingItem.isAdded ? "Added" : "Not Added"
            isAddedLabel.text = status
        }
    }
}
