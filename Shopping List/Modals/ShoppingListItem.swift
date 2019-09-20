//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListItem: Codable {
    var name: String
    var hasBeenAdded: Bool
    
    
    init(name: String, hasbeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}


//struct shoppingItem:Codable, Equatable, Decodable {
//    
//    var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "muffin", "Popcorn", "Soda",  "Strawberries"]
//    var addedShoppingItems: Bool
//    var image: UIImage
// 
//    
//    let userDefaults = UserDefaults.standard.bool(forKey: "addedShoppingItems")
//    
//    init(nameOfShoppingItems: String, addedShoppingItems: Bool) {
//        self.nameOfShoppingItems = [nameOfShoppingItems]
//        self.addedShoppingItems = addedShoppingItems
//    }
//    
//}







