//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 15/11/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    var shoppingList: [ShoppingItem] {
        let items = [ShoppingItem(name: "Apple", image: UIImage(named: "Apple")),
                     ShoppingItem(name: "Grapes", image: UIImage(named: "Grapes")),
                     ShoppingItem(name: "Milk", image: UIImage(named: "Milk")),
                     ShoppingItem(name: "Muffin", image: UIImage(named: "Muffin")),
                     ShoppingItem(name: "Popcorn", image: UIImage(named: "Popcorn")),
                     ShoppingItem(name: "Soda", image: UIImage(named: "Soda")),
                     ShoppingItem(name: "Strawberries", image: UIImage(named: "Strawberries"))]
        
        return items
    }
}
