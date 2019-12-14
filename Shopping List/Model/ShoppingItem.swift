//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
//import UIKit

struct ShoppingItem: Equatable, Codable {
    
    var name: String
    var hasBeenAdded: Bool

    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
    
}
