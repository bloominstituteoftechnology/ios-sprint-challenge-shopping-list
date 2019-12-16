//
//  ShoppingController.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    var items: [Items] {
        
   var item = [
    Items(name: "Apple", imageName: "Apple"),
        Items(name: "Grapes", imageName: "Grapes"),
        Items(name: "Milk", imageName: "Milk"),
        Items(name: "Muffin", imageName: "Muffin"),
        Items(name: "Popcorn", imageName: "Popcorn"),
        Items(name: "Soda", imageName: "Soda"),
        Items(name: "Strawberries", imageName: "Strawberries"),
        ]

    return item
    }
}
