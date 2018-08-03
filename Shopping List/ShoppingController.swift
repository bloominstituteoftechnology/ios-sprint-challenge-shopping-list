//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController {
    
    init() {
        if userDefaultsManager.hasShoppingListBeenInitialized == false {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for itemName in itemNames {
                guard let image = UIImage(named: itemName) else { return }
                createShoppingList(image: image, name: itemName)
                userDefaultsManager.initShoppingList()
            }
        } else { return }
    }
    
    
    
    // Create items
    func createShoppingList(image: UIImage, name: String, addedToList: Bool = false) {
        let shoppingItem = ShoppingItem(image: image, name: name)
        shoppingItems.append(shoppingItem)
    }
    
    
    // Check or uncheck addedToList
    func updateAddedToList(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList = !shoppingItems[index].addedToList
    }
    
    // Read
    var shoppingItems = [ShoppingItem]()
    
    // UserDefaults
    let userDefaultsManager = UserDefaultsManager()
}
