//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Isaac Lyons on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name: String
    var onList: Bool
}
