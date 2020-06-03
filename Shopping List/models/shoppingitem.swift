//
//  shoppingitem.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

struct ShoppingItem: Codable, Equatable {
    
    let itemName: String
    var hasBeenAdded: Bool
   
    
    init(itemName: String, hasBeenAdded: Bool = false) {
        self.itemName = itemName
        self.hasBeenAdded = hasBeenAdded
        
    }
}
