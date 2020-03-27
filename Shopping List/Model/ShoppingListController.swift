//
//  ShoppingListItemController.swift
//  ShoppingList
//
//  Created by Lambda_School_Losaner_256 on 1/31/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import Foundation
import UIKit


class ShoppingListController {
    
    var shoppingList: [ShoppingList] = [
        
        ShoppingList(itemName: "Apples", itemAdded: false, itemName: "Apple")
        ShoppingList(itemName: "Grapes", itemAdded: false, itemName: "Grapes")
        ShoppingList(itemName: "Milk", itemAdded: false, itemName: "Milk")
        ShoppingList(itemName: "Muffin", itemAdded: false, itemName: "Muffin")
        ShoppingList(itemName: "Popcorn", itemAdded: false, itemName: "Popcorn")
        ShoppingList(itemName: "Soda", itemAdded: false, itemName: "Soda")
        ShoppingList(itemName: "Strawberries", itemAdded: false, itemName: "Strawberries")]
    
    func itemAdded(itemName: ShoppingList) {
        guard let itemAdded = shoppingList.firstIndex(of: item) {
        shoppingList[itemAdded].imageData = imageData
        shoppingList[itemAdded].title = imageTitle
        
    }
}
