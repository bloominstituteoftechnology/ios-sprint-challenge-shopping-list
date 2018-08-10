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
    
    
    
    func updateIsAdded(shoppingItem: Item){
        guard let index = shoppingItems.index(of: shoppingItem) else {return}
        var scratch = shoppingItem
        scratch.isAdded = !shoppingItem.isAdded
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratch, at: index)
        saveToPersistence()
    }
    
    

    
    
}
