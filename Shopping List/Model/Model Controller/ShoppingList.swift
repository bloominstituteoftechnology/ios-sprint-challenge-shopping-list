//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingList {
    
    var items: [ShoppingItem] {
        
        var result = [
            ShoppingItem(itemName: "Apple", imageName: "Apple"),
            ShoppingItem(itemName: "Grapes", imageName: "Grapes"),
            ShoppingItem(itemName: "Milk", imageName: "Milk"),
            ShoppingItem(itemName: "Muffin", imageName: "Muffin"),
            ShoppingItem(itemName: "Popcorn", imageName: "Popcorn"),
            ShoppingItem(itemName: "Soda", imageName: "Soda"),
            ShoppingItem(itemName: "Strawberries", imageName: "Strawberries")]
        
    }
    
    var addedOrNot : String? {
        
        return UserDefaults.standard.string(forKey: addedOrNotPrefrenceKey)
        
    }

    let addedOrNotPrefrenceKey: String = "addedOrNotPrefrenceKey"

    init() {
        setButtonToNotAdded()
    }
    
    
    func setButtonToNotAdded() {
        
        UserDefaults.standard.set("Not Added", forKey: addedOrNotPrefrenceKey)
        
    }
    
    func setButtonToAdded() {
        
        UserDefaults.standard.set("Added", forKey: addedOrNotPrefrenceKey)
    }
}
