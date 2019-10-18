//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var inCartLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        itemNameLabel.text = shoppingItem.name
        inCartLabel.text = shoppingItem.isInList ? "Added" : "Not Added"
        itemImage.image = UIImage(data: shoppingItem.image)
    }
    
}
