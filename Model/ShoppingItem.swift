//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItems: Codable, Equatable {
    var name: String
    var hasBeenAdded: Bool = false
    
    static func isEqualTo(lhs: ShoppingItems, rhs: ShoppingItems) -> Bool {
        return lhs.name == rhs.name
    }
}

