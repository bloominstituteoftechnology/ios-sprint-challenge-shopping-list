//
//  Info.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    
    let name: String
    let imageData: Data
    var isInCart: Bool
    
    init(name: String, image: Data, isInCart: Bool = false) {
        self.name = name
        self.imageData = image
        self.isInCart = isInCart
    }
}
