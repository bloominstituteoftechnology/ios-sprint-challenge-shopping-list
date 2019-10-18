//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] {
        let result = [ShoppingItem(itemName: "Apple", added: false),
                      ShoppingItem(itemName: "Grapes", added: false),
                      ShoppingItem(itemName: "Milk", added: false),
                      ShoppingItem(itemName: "Muffin", added: false),
                      ShoppingItem(itemName: "Popcorn", added: false),
                      ShoppingItem(itemName: "Soda", added: false),
                      ShoppingItem(itemName: "Strawberries", added: false),]
        
        return result
    }
}
