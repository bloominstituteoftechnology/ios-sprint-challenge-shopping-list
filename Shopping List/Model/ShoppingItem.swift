//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
    var imageName: String
    var name: String
    var hasBeenAdded: Bool
    
    init(imageName: String, name: String, hasBeenAdded: Bool = false) {
        self.imageName = imageName
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
