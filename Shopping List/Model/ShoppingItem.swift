//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//
import Foundation

struct ShoppingItem: Equatable, Codable {

    var name: String
    var addedItem: Bool

    init(name: String, addedItem: Bool = false) {
        self.name = name
        self.addedItem = addedItem
    }

}
