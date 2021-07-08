//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

// restructured model

struct ShoppingItem: Equatable, Codable {

    let name: String
    let imageName: String
    var isAdded: Bool
    var imageData: Data?
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
        self.isAdded = false
    }
}

