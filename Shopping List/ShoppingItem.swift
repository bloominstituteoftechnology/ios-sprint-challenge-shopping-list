//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    let name: String
    let imageName: String
    var hasBeenAdded: Bool
    
    init(name:String, imageName: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.hasBeenAdded = hasBeenAdded
    }
}
