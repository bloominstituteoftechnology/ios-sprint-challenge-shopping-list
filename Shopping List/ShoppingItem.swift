//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


struct ShoppingItem: Encodable {
    
    let name: String
    let isOnShoppingList: Bool
    let image: UIImage
    
    init(name: String, isOnShoppingList: Bool, image: String) {
        
        self.name = name
        self.isOnShoppingList = isOnShoppingList
        self.image = UIImage(named: image)!
        
    }
}
