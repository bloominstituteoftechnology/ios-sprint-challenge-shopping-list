//
//  ShoppingListItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var shoppingItemImage: UIImageView!
    
var shopList: ShoppingListItem? {
    didSet{
        updateViews()
    }
}
func updateViews() {
    guard let shopList = shopList else { return }
    ItemNameLabel.text = shopList.imageName
    shoppingItemImage.image = UIImage(named: shopList.imageName)
    if shopList.hasBeenAdded == false {
        addedLabel.text = "Not Added"
    } else if shopList.hasBeenAdded == true {
        addedLabel.text = "Added"
    }
    
}
}
