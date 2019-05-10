//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
protocol ShoppingItemControllerDelegate {
    func grabTheTotal(for total: ShoppingItemController)
}

class ShoppingItemController {
    
    //Mark: - Functions
    func updateTotal() -> Int{
        var orderTotal = 0
        for item in shoppingList {
            if item.added == true{
                orderTotal += 1
            }
        }
        return orderTotal
    }

    func updateItemHasBeenAdded(shoppingItem: ShoppingItem) {
        guard let itemIndex = shoppingList.firstIndex(of: shoppingItem) else { return }
        if shoppingList[itemIndex].added == false  {
            shoppingList[itemIndex].added = true
        } else {
            shoppingList[itemIndex].added = false

        }



    }

    //Mark: - Properties
    var shoppingList: [ShoppingItem] = [
        ShoppingItem(name: "Apple", imageName: "Apple", added: true),
        ShoppingItem(name: "Grapes", imageName: "Grapes", added: false),
        ShoppingItem(name: "Milk", imageName: "Milk", added: false),
        ShoppingItem(name: "Muffin", imageName: "Muffin", added: false),
        ShoppingItem(name: "Popcorn", imageName: "Popcorn", added: false),
        ShoppingItem(name: "Soda", imageName: "Soda", added: false),
        ShoppingItem(name: "Strawberries", imageName: "Strawberries", added: false)

    ]
}
