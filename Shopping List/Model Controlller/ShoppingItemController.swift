//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController{
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var shoppingItems : [Item] = []
     
    func createShoppingItem(name: String, image: String){
        for names in itemNames{
            let shoppingItem = Item(name: names, image: names)
            shoppingItems.append(shoppingItem)
        }
    }
    
    
    
   
    func toggleIsSeen(shoppingItem: Item){
        if shoppingItem.isAdded == false{
            shoppingItem.isAdded = true
            } else {
            shoppingItem.isAdded = false
            }

        }
    
    
    
    //for read section
    var addedItem: [Item]{
        return shoppingItems.filter({$0.isAdded})
    }
    
    var notAddedItem: [Item]{
        return shoppingItems.filter({$0.isAdded == false})
    }

    
    
}
