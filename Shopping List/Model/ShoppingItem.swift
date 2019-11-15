//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Angelique Abacajan on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    let shoppingItem: String
    var added: Bool = false
}
