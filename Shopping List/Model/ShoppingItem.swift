//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    
    var name: String
    var imageName: String
    var hasBeenAdded: Bool
}

