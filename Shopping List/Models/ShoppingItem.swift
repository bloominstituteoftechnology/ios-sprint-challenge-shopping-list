//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    
    let name: String
    var addedToList = true
    
    init(name: String, addedToList: Bool) {
        self.name = name
        self.addedToList = addedToList
    }
}
