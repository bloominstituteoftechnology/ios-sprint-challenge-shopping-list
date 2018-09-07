//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
struct ShoppingItem: Equatable, Codable {
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
        self.isAdded = false
        
    }
    
    let name: String
    let imageName: String
    var isAdded: Bool
    var imageData: Data?
}
