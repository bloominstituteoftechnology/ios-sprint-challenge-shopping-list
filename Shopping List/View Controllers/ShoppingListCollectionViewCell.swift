//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isSelectedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        nameLabel.text? = shoppingItem.name
        isSelectedLabel.text? = shoppingItem.isAdded ? "Added" : "Not Added"
        isSelectedLabel.textColor = shoppingItem.isAdded ? .orange : .black
        let itemImage = UIImage(named: shoppingItem.imageName)
        shoppingItemImageView.image = itemImage
        nameLabel.text = shoppingItem.name
        
    }
    
}
