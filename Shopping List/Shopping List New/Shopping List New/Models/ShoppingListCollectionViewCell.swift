//
//  ShoppingListCollectionViewCell.swift
//  Shopping List New
//
//  Created by Uptiie on 9/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
        
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        isAddedLabel.text = shoppingItem.wasAdded ? "Added" : "Add"
        itemNameLabel.text = shoppingItem.imageName
        let image = UIImage(named: shoppingItem.imageName)
        itemImage.image = image
    }
}
