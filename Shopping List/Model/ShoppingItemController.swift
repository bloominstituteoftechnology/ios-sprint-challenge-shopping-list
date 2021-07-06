//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingItemController  {
    
    let itemNames = [
        ShoppingItem(image: "apple", nameOfItem: "Apple"),
        ShoppingItem(image: "grapes", nameOfItem: "Grapes"),
        ShoppingItem(image: "milk", nameOfItem: "Milk"),
        ShoppingItem(image: "muffin", nameOfItem: "Muffin"),
        ShoppingItem(image: "popcorn", nameOfItem: "Popcorn"),
        ShoppingItem(image: "soda", nameOfItem: "Soda"),
        ShoppingItem(image: "strawberries", nameOfItem: "Strawberries")
    ]
    
    func updateBool(item: ShoppingItem) {
        var itemToUpdate = item
        if itemToUpdate.addedToCart == false {
            itemToUpdate.addedToCart = true
        } else {
            itemToUpdate.addedToCart = false
        }
    }
}
