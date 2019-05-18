//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name:       String
    var imageName:  String
    var beenAdded:  Bool
    
    init(name: String, imageName: String, beenAdded: Bool = false) {
        self.name       = name
        self.imageName  = imageName
        self.beenAdded  = beenAdded
    }
}
