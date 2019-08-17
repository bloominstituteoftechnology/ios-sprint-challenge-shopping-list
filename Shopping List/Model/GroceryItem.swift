//
//  GroceryItem.swift
//  Shopping List
//
//  Created by Bobby Keffury on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct GroceryItem: Encodable {
    var itemName: String
    var wasAdded: Bool = false
}
