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
    let addedToList = false
    
    init(name: String) {
        self.name = name
    }
}
