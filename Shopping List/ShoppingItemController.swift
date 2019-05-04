//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController{
    
        
    
    
    var shoppingList: [ShoppingItem] = [
            ShoppingItem(name: "Apple", imageName: "apple", added: false),
            ShoppingItem(name: "Grapes", imageName: "grapes", added: true),
            ShoppingItem(name: "Milk", imageName: "milk", added: false),
            ShoppingItem(name: "Muffin", imageName: "muffin", added: false),
            ShoppingItem(name: "Popcorn", imageName: "popcorn", added: false),
            ShoppingItem(name: "Soda", imageName: "soda", added: false),
            ShoppingItem(name: "Strawberries", imageName: "strawberries", added: false)
        
            ]
    
    func updateItemHasBeenAdded(shoppingItem: ShoppingItem) {
        print("\(shoppingItem) Has Been Updated")

        guard let itemIndex = shoppingList.firstIndex(of: shoppingItem) else { return }
        if shoppingList[itemIndex].added == false {
            shoppingList[itemIndex].added = true
        } else {
            shoppingList[itemIndex].added = false
        }
        
        print("\(shoppingList[itemIndex]) Has Been Updated")

    }
    
}
