//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Shillingford on 7/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    var name: String
    var isAdded: Bool
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
    }
}
