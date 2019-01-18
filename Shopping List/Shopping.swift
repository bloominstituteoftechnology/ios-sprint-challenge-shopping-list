//
//  Shopping.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Shopping: Equatable, Codable {
    var name: String
    var image: String
    var hasBeenAdded: Bool
    
    init(name: String, image: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.image = image
        self.hasBeenAdded = hasBeenAdded
    }
    
}
