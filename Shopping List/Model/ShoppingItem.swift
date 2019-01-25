//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


struct ShoppingItem {
    //image, name of the item, and Bool indicating whether the item has been added to the shopping list.
    
    var image: UIImage
    var nameOfItem: String
    var addedToCart: Bool
    
    init(image: String, nameOfItem: String, addedToCart: Bool = false) {
        self.image = UIImage(named: image)!
        self.nameOfItem = nameOfItem
        self.addedToCart = addedToCart
    }
    
}
