//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Casualty on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var isAvailable: Bool
    let name: String
    let image: String
    
    init(name: String) {
        self.isAvailable = false
        self.name = name
        self.image = name
    }
}
