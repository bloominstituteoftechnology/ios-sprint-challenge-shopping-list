//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Robert B on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
struct ShoppingItem: Codable, Equatable {
    var name: String
    var isListed: Bool
    
    init(name: String, isListed: Bool = false) {
        self.name = name
        self.isListed = isListed
    }
}
