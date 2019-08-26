//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation



struct shoppingItem:Codable, Equatable {
    var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "muffin", "Popcorn", "Soda",  "Strawberries"]
    var addedShoppingItems: Bool
 
    
    let userDefaults = UserDefaults.standard.bool(forKey: "addedShoppingItems")
    
    init(nameOfShoppingItems: String, addedShoppingItems: Bool) {
        self.nameOfShoppingItems = [nameOfShoppingItems]
        self.addedShoppingItems = addedShoppingItems
    }
    
}
