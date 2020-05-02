//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListItems {
    var items: [ShoppingItem] {

        let items = [
        ShoppingItem(imageName: "Apple", names: "Apple"),
        ShoppingItem(imageName: "Grapes", names: "Grapes"),
        ShoppingItem(imageName: "Milk", names: "Milk"),
        ShoppingItem(imageName: "Muffin", names: "Muffin"),
        ShoppingItem(imageName: "Popcorn", names: "Popcorn"),
        ShoppingItem(imageName: "Soda", names: "Soda"),
        ShoppingItem(imageName: "Strawberries", names: "Strawberries"),
        ]
        return items
    }
}
