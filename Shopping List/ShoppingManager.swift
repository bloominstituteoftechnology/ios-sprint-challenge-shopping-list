//
//  ShoppingManager.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingManager {
    var shoppingList: [ShoppingItem] = []
    
    var selectedItems: [ShoppingItem] {
        return shoppingList.filter { $0.hasBeenAdded == true }
    }
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    let initKey = "myKey"
    private(set) var initCheck: Bool?
    
    init() {
        initCheck = UserDefaults.standard.bool(forKey: initKey)
        //if initCheck == false{
            for item in itemNames {
                if let image = UIImage(named: item) {
                    let x = ShoppingItem(imageName: item, itemName: item, hasBeenAdded: false, itemImage: image)
                    shoppingList.append(x)
                }
            } //End of for loop
           UserDefaults.standard.set(true, forKey: initKey)
       // } //End of if statement
    }
    //
    func updateStatus(item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].hasBeenAdded = !shoppingList[index].hasBeenAdded
    }
}
