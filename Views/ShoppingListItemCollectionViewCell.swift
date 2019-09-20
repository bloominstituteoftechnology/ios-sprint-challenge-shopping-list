//
//  ShoppingListItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListItemCollectionViewCell: UICollectionViewCell {
    
}



var shopList: ShoppingListItem? {
    
    didSet{
        
        updateViews()
    }
}



func updateViews() {
    guard let item = shopList else { return }
    
    imageOutlet.image = UIImage(data: )
}
