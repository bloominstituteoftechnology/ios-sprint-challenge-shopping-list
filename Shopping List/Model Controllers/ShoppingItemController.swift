//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    private var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    init() {
        for name in itemNames {
            createItem(name: name)
        }
    }

    func createItem(name: String) {
        let item = ShoppingItem(name: name, hasBeenAdded: false)
        shoppingItems.append(item)
    }


}
