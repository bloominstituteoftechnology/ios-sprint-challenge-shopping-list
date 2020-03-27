//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingItemController {
    
    let key = "id"
    let itemNames: [ShoppingEnum] = [.apple, .grapes, .milk, .muffin, .popcorn, .soda, .strawberries]
    
    init() {
        loadPersistence()
    }
    
    //Functions
    /*func savePersistence() {
        let userDefault = UserDefaults.standard
        userDefault.set([], forKey: <#T##String#>)
    } */
    
    func loadPersistence() {
        if UserDefaults.standard.array(forKey: key) == nil {
            //savePersistence()
        }
    }
    
    
}

