//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Lambda_School_Losaner_256 on 1/31/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    let name: String
    var added: Bool = true
}

