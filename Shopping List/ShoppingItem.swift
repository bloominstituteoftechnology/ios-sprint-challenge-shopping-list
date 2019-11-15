//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Sezen Bozdogan on 15.11.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
 
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var hasBeenAdded: Bool? = false
    
       
    
    init(itemNames: [String], hasBeenAdded: Bool) {
        self.hasBeenAdded = hasBeenAdded
    }
}

func changeHasBeenAdded() {
    
    switch hasBeenAdded {
    case hasBeenAdded == false {
        let hasBeenAdded = true
        }
    case hasBeenAdded == true {
        let hasBeenAdded = false
        }
        
    }
}
