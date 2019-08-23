//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Joshua Sharp on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name: String
    var selected: Bool
    
    mutating func toggleSelected () {
        self.selected = !self.selected
    }
}
