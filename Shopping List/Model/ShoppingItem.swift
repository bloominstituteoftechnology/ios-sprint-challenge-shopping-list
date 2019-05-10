//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    let name: String
    var addedToList: Bool
    
    init(name: String, addedToList: Bool = false) {
        self.name = name
        self.addedToList = addedToList
    }
}
