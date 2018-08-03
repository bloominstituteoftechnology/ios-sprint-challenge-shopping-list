//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var image: Data
    var name: String
    var addedToList: Bool = false
}
