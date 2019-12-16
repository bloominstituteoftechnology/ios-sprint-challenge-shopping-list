//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by David Wright on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    var name: String
    var isOnShoppingList: Bool = false
}

extension ShoppingItem: Equatable {
    static func ==(lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
}
