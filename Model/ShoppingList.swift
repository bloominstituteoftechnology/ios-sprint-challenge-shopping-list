//
//  ShoppingList.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    var name: String 
    var hasBeenAdded: Bool = false
}
