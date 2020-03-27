//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingItemController {
    
    let key = "myKey"
    let itemNames: [ShoppingEnum] = [.apple, .grapes, .milk, .muffin, .popcorn, .soda, .strawberries]
    
    var shoppingItems: [ShoppingItem?] = [
        ShoppingItem(name: .apple, inShoppingList: false),
        ShoppingItem(name: .grapes, inShoppingList: false),
        ShoppingItem(name: .milk, inShoppingList: false),
        ShoppingItem(name: .muffin, inShoppingList: false),
        ShoppingItem(name: .popcorn, inShoppingList: false),
        ShoppingItem(name: .soda, inShoppingList: false),
        ShoppingItem(name: .strawberries, inShoppingList: false),]
    
    init() {
        loadPersistence()
    }
    
    //Functions
    func savePersistence() {
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: key)
    }
    
    func loadPersistence() {
        if UserDefaults.standard.bool(forKey: key) == nil {
            savePersistence()
        }
    }
}

