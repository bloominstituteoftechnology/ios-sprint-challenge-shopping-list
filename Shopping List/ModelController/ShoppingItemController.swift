//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController {

    let itemNames: [ShoppingItem] = [ShoppingItem(name: "Apple",
                                                  isOnShoppingList: false, image: "apple"),
                                     ShoppingItem(name: "Grapes",
                                                  isOnShoppingList: false, image: "grapes"),
                                     ShoppingItem(name:"Milk", isOnShoppingList:
                                        false, image: "milk"),
                                     ShoppingItem(name: "Muffin",
                                                  isOnShoppingList: false, image: "muffin"),
                                     ShoppingItem(name: "Popcorn",
                                                  isOnShoppingList: false, image: "popcorn"),
                                     ShoppingItem(name: "Soda", isOnShoppingList:
                                        false, image: "soda"),
                                     ShoppingItem(name: "Strawberries",
                                                  isOnShoppingList: false, image: "strawberries")]
    
    
    
    let isOnShoppingList = UserDefaults.standard.bool(forKey: //Haven't madde this yet)
        
        if isOnShoppingList {
        //show as such in it's collection view cell.
    }
    
}
