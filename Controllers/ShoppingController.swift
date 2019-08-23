//
//  ShoppingController.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController{
    var shoppingItem: [ShoppingItem]{
        let itemNames = ["Apple", "Grapes", "Milk", "Popcorn", "Soda", "Straberries"]
        
        for item in itemNames{
            ShoppingItem.init(item: item, hasBeenAdded: false)
        }
    }
}
