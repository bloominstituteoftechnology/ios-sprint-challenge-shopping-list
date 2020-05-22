//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
 //Read
    var shoppingItems = [ShoppingItem(name: "Apples", addedToCart: false, imageName: "Apple"),
                         ShoppingItem(name: "Grapes", addedToCart: false, imageName: "Grapes"),
                         ShoppingItem(name: "Milk", addedToCart: false, imageName: "Milk"),
                         ShoppingItem(name: "Muffin", addedToCart: false, imageName: "Muffin"),
                         ShoppingItem(name: "Popcorn", addedToCart: false, imageName: "Popcorn"),
                         ShoppingItem(name: "Soda", addedToCart: false, imageName: "Soda"),
                         ShoppingItem(name: "Strawberries", addedToCart: false, imageName: "Strawberries")]
}

//reate



//Update




//Delete



// MARK: - Persistence

var persistentFileURL: URL? {
    
    let fileManager = FileManager.default
}
