//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

enum ShoppingEnum: String {
    case apple = "Apple"
    case grapes = "Grapes"
    case milk = "Milk"
    case muffin = "Muffin"
    case popcorn = "Popcorn"
    case soda = "Soda"
    case strawberries = "Strawberries"
}


class ShoppingItem {
    var name: ShoppingEnum
    
    var inShoppingList: Bool
    
    var image: UIImage? {
        return UIImage(named: name.rawValue)
    }
    
    
    init(name: ShoppingEnum, inShoppingList: Bool) {
        self.name = name
        self.inShoppingList = inShoppingList
        image
    }
    
    
    
    
    
    
}
