//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var name: String
    var imageData: Data
    var isAdded: Bool
}
