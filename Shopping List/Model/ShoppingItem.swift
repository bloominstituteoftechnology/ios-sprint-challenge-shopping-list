//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Eoin Lavery on 19/08/2019.
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
