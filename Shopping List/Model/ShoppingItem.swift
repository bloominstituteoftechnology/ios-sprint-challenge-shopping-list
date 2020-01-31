//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by beth on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {

    var name: String
    var hasBeenAdded: Bool

    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }

}
