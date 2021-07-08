//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Welinkton on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
   func updateViews(){
    
    guard let shoppingItem = shoppingItem else {return}
    
    //shoppingItem.isAdded = shoppingItem.isAdded ? isAddedLabel.text = "Is Added"  : !isAddedLabel.text = "Not Added"
    
    if shoppingItem.isAdded == true {
        isAddedLabel.text = "Added"
    } else {
        isAddedLabel.text = "Not Added"
    }
    
    let itemImage = UIImage(named: shoppingItem.imageName)
    imageView.image = itemImage
    nameLabel.text = shoppingItem.name
    
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
}
