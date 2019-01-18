//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    private(set) var shoppingItems: [Shopping] = []
    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    init(){
        if UserDefaults.standard.bool(forKey: .isInitiatedKey){
            
        } else {
          createItems()
        }
    }
    
    func createItems(){
        
        for name in itemNames {
            let items = Shopping(name: name, image: name)
            shoppingItems.append(items)
            UserDefaults.standard.set(true, forKey: .isInitiatedKey)
        }
    }
}
