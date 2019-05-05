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
    
   // private var pickedItem: [ShoppingItem] = []
    
    var pickedItems: [String] = []

    var shoppingItems = [
        ShoppingItem(imageName: "apple", itemName: "apple"),
        ShoppingItem(imageName: "grapes", itemName: "grapes"),
        ShoppingItem(imageName: "milk", itemName: "milk"),
        ShoppingItem(imageName: "muffin", itemName: "muffin"),
        ShoppingItem(imageName: "popcorn", itemName: "popcorn"),
        ShoppingItem(imageName: "soda", itemName: "soda"),
        ShoppingItem(imageName: "strawberries", itemName: "strawberries"),
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
