//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    
    // MARK: Properties
    
    var shoppingList: [ShoppingItem] {
        get {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            var shoppingList: [ShoppingItem] = []
            for item in itemNames {
                shoppingList.append(ShoppingItem(name: item))
            }
            return shoppingList
        }
        set {}
    }
    
    // MARK: - CRUD
    
    func updateItem(item: ShoppingItem, didAdd: Bool) {
        guard let itemIndex = shoppingList.firstIndex(of: item) else {return}
        
        shoppingList[itemIndex].didAdd = didAdd
    }
}
