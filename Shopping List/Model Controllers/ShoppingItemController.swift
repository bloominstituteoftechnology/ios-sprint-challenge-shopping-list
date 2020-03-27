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
    
    var shoppingList = [ShoppingItem(name: "Apple"),
                        ShoppingItem(name: "Grapes"),
                        ShoppingItem(name: "Milk"),
                        ShoppingItem(name: "Muffin"),
                        ShoppingItem(name: "Popcorn"),
                        ShoppingItem(name: "Soda"),
                        ShoppingItem(name: "Strawberries")]

    // MARK: - CRUD
    
    func createItem(name: String) {
        shoppingList.append(ShoppingItem(name: name))
    }
    
    func updateItem(item: ShoppingItem) {
        guard let itemIndex = shoppingList.firstIndex(of: item) else {return}
        
        shoppingList[itemIndex].didAdd = !shoppingList[itemIndex].didAdd
    }
}
