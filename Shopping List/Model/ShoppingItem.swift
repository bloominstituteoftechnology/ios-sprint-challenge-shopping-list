//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Enzo Jimenez-Soto on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    var name: String
    var isAdded: Bool
    
    init(name: String) {
        self.name = name
        isAdded = false
    }
}
