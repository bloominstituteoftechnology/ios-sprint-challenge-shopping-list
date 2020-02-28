//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController {
    
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var items: [ShoppingItem] {
        var result: [ShoppingItem] = []
        
        for item in itemNames {
            result.append(ShoppingItem(name: item))
        }
        
        #warning("check user defualts and save")
        
        return result
    }
    
    
    
}
