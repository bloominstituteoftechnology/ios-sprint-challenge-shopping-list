//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
     let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    
    init() {
        let userDefaults = UserDefaults.standard
        for item in itemNames {
            let image = UIImage(named: item)
            let data = UIImagePNGRepresentation(image!)
            create(imageData: data!, title: item)
            userDefaults.set(item, forKey: item)
        }
    }
    
    
    func create(imageData: Data, title: String) {
        let shoppingItem = ShoppingItem(imageData: imageData, title: title)
        shoppingItems.append(shoppingItem)
    }
    
    func update() {
        
    }
}
