//
//  ShoppingItem.swift
//  ChallengeTry
//
//  Created by Ryan Murphy on 5/10/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable, Equatable {
    var name: String
    var imageData: Data
    var isOnList: Bool
    
    init(name: String, image: Data, isOnList: Bool = false) {
        self.name = name
        self.imageData = image
        self.isOnList = isOnList
        
    }
}
