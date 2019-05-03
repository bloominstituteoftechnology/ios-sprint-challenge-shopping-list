//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    let firstTimeLoadedKey: String
    var firstTimeLoaded: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: self.firstTimeLoadedKey)
        }
    }
    
    private(set) var shoppingItems: [ShoppingItem] = []
    
    // Items should only load once
    init() {
        // At first should be 0
        print(shoppingItems.count)
        
        // Give a dummy value for first time
        self.firstTimeLoadedKey = "-1"
        
        // If bool is nil then it means it's the first time installing this app.
        if self.firstTimeLoaded == nil
        {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            
            // Load each item
            for item in itemNames
            {
                self.createShoppingItem(image: UIImage(imageLiteralResourceName: item), name: item)
            }
            
            // Set key
            UserDefaults.standard.set(true, forKey: firstTimeLoadedKey)
            
        }
        // Then should be 7
        print(shoppingItems.count)
        
    }
    
    func createShoppingItem(image: UIImage, name: String) {
        self.shoppingItems.append(ShoppingItem(image: image, name: name))
    }
    
}
