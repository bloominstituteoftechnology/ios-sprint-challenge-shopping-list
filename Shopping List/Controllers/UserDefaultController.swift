//
//  DefaultInitializer.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct UserDefaultController {
    
    var initKey: String = "allItemsSet"
    
    func setDefault() {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            UserDefaults.standard.set(item, forKey: item)
        }
        UserDefaults.standard.set(true, forKey: initKey)
    }
}
