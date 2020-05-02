//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vici Shaweddy on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable, Equatable {
    var itemName: String
    var hasBeenAdded: Bool
}
