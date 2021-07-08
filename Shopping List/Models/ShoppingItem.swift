//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Gi Pyo Kim on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
