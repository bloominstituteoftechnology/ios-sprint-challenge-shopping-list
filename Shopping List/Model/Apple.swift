//
//  Apple.swift
//  Shopping List
//
//  Created by Joshua Franklin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    var name: String
    var addedItem: Bool?
    
    init(name: String, addedItem: Bool) {
        
        self.name = name
        self.addedItem = addedItem
    }
}
