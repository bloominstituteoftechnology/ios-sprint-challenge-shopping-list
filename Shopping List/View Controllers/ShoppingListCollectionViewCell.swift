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
        shoppingItemImageView.image = UIImage(data: shoppingItem.imageData)
        nameLabel.text? = shoppingItem.name
        isSelectedLabel.text? = shoppingItem.isSelected ? "Added" :
    "Not Added"
        isSelectedLabel.textColor = shoppingItem.isSelected ? .black : .orange
    }
    
}
