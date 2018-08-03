//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    let imageData: Data
    let name: String
    var addedToList: Bool
    
    init(imageData: Data, name: String, addedToList: Bool = false) {
        self.imageData = imageData
        self.name = name
        self.addedToList = addedToList
    }
}
