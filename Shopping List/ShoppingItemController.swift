//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Thoai Le on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] {
        var result = [ShoppingItem(name: "Apple"),
                      ShoppingItem(name: "Grape"),
                      ShoppingItem(name: "Milk"),
                      ShoppingItem(name: "Muffin"),
                      ShoppingItem(name: "Popcorn"),
                      ShoppingItem(name: "Soda"),
                      ShoppingItem(name: "Strawberries")]
        
        let ShopingItem = UserDefaults.standard.bool(forKey: ShoppingItemKey)
        if ShoppingItem {
            result.append(ShoppingItem(name:""))
        }
        return result
    }
}
