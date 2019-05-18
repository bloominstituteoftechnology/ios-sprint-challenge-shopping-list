//
//  Shopping.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 5/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable{
    
    var itemName    : IndexPath
    var addedToCart : Bool
    
    init(itemName: IndexPath, addedToCart: Bool) {
        self.itemName = itemName
        self.addedToCart = addedToCart
    }
    
}

