//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingList: Equatable, Codable {
    
    var name: String
    var image: String
    var itemAdded: Bool
 
    init (name: String, imageName: String , itemAdded: Bool = false) {
        self.name = name
        self.image = imageName
        self.itemAdded = itemAdded
    }
}

