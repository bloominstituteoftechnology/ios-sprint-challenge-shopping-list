//
//  ListController.swift
//  Shopping List
//
//  Created by LaFleur on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ListController {
    var itemNames: [ShoppingItem] {
        
        var result = [
            
            ShoppingItem(shoppingItem: "Apple", imageName: "apple"),
        ShoppingItem(shoppingItem: "Grapes", imageName: "grapes"),
        ShoppingItem(shoppingItem: "Milk", imageName: "milk"),
        ShoppingItem(shoppingItem: "Muffin", imageName: "muffin"),
        ShoppingItem(shoppingItem: "Popcorn", imageName: "popcorn"),
        ShoppingItem(shoppingItem: "Soda", imageName: "Soda"),
        ShoppingItem(shoppingItem: "Strawberries", imageName: "strawberries"),
        
        ]
        let shouldBeAdded = UserDefaults.standard.bool(forKey: .shouldBeAddedKey) // ????????????????
        if shouldBeAdded {
            result.append(ShoppingItem(shoppingItem: <#T##String#>, imageName: <#T##String#>))   //?????????????????
        }
        return result
    }
    
}
