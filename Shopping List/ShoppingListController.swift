//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingItems: [ShoppingItem] = {
        var items = [ShoppingItem(name: "Apple"),
                     ShoppingItem(name: "Grapes"),
                     ShoppingItem(name: "Milk"),
                     ShoppingItem(name: "Muffin"),
                     ShoppingItem(name: "Popcorn"),
                     ShoppingItem(name: "Soda"),
                     ShoppingItem(name: "Strawberries")]
        return items
    }()

    
    func updateAddedToCart(for item: ShoppingItem) {
        guard let itemIndex = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[itemIndex].addedToShoppingList.toggle()
    }
}
