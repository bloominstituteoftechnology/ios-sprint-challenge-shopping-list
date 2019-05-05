//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    // MARK: - Properties
    
    static let defaults = UserDefaults.standard
    
   var pickedItems: [String] = []

    var shoppingItems = [
        ShoppingItem(imageName: "apple", itemName: "apple", itemOrdered: false),
        ShoppingItem(imageName: "grapes", itemName: "grapes", itemOrdered: false),
        ShoppingItem(imageName: "milk", itemName: "milk", itemOrdered: false),
        ShoppingItem(imageName: "muffin", itemName: "muffin", itemOrdered: false),
        ShoppingItem(imageName: "popcorn", itemName: "popcorn", itemOrdered: false),
        ShoppingItem(imageName: "soda", itemName: "soda", itemOrdered: false),
        ShoppingItem(imageName: "strawberries", itemName: "strawberries", itemOrdered: false),
        ]
    
/*
 
*/
   
//    func updateOrdedStatus(itemIndex: Int) {
//        shoppingItems[itemIndex].itemOrdered = !shoppingItems[itemIndex].itemOrdered
//        print("This is the updateOrdedStatus function.  Will update shoppingitems[\(itemIndex)]")
//        print("Item name is \(shoppingItems[itemIndex].itemName)")
//        print("Item current order status is \(shoppingItems[itemIndex].itemOrdered)")
//        // Update the ordered status
//        shoppingItems[itemIndex].itemOrdered = !shoppingItems[itemIndex].itemOrdered
//    }
    
//    let itemOrderedKey = "ItemOrderedKey"
//    func saveOrdered(_ itemOrdered: String) {
//        // itemOrdered = true
//        for itemName in shoppingItems {
//            print(itemName, itemOrdered)
//        }
        
        
        
        
//        if let itemOrderedKey = UserDefaults.standard.string
//        UserDefaults.standard.set(pickedItems, forKey: itemOrderedKey)
    
}
