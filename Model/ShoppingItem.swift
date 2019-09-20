//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItem {
    var name: String
    var isAdded: Bool = false
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
    }
}


