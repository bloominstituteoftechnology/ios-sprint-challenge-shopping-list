//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable, Equatable {
    var name: String
    var imageData: String
    var isOnList: Bool
    
    init(name: String, image: String, isOnList: Bool = false) {
        self.name = name
        self.imageData = image
        self.isOnList = isOnList
        
    }
}
