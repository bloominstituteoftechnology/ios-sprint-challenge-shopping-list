//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    let name: String
    var hasBeenAdded: Bool
    
    init(name: String) {
        self.name = name
        self.hasBeenAdded = false
    }
}
