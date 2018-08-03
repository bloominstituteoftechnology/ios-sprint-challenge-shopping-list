//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    //MARK: - PROPERTIES
    var itemsThatAreAdded: Int {
        var count = 0
        for item in shoppingList {
            if item.addedToShoppingList {
                count += 1
            }
        }
        return count
    }
    
    private (set) var shoppingList = [
        ShoppingItem(name: "apple", imageName: "apple"),
        ShoppingItem(name: "grapes", imageName: "grapes"),
        ShoppingItem(name: "milk", imageName: "milk"),
        ShoppingItem(name: "muffin", imageName: "muffin"),
        ShoppingItem(name: "popcorn", imageName: "popcorn"),
        ShoppingItem(name: "soda", imageName: "soda"),
        ShoppingItem(name: "strawberries", imageName: "strawberries")
    ]
    
    var sortedShoppingList: [ShoppingItem] {
        return shoppingList.filter { $0.addedToShoppingList } + shoppingList.filter { !$0.addedToShoppingList}
    }
    
    //MARK: - METHODS
    func switchAddedToShoppingList(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].addedToShoppingList = !shoppingList[index].addedToShoppingList
    }
    
    func addItem(name: String, image: UIImage) {
        let newItem = ShoppingItem(name: name, image: image)
        shoppingList.append(newItem)
    }
}
