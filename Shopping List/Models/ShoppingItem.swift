//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dennis Rudolph on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable{
    let name: String
    var added: Bool = false
}
