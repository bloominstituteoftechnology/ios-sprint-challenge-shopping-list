//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    let cell = ShoppingListCollectionViewCell()
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    var shoppingListURL: URL? {
        
        let fileManager = FileManager.default
        guard let URL = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first else { return nil }
        return URL.appendingPathComponent("ShoppingList.plist")
    }
}
