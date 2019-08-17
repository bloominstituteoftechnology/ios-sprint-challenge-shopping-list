//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Joel Groomer on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {
    let name: String
    var inShoppingList: Bool
    let image: String
    let selectedImage: String
    
    init(name: String) {
        self.name = name
        self.inShoppingList = false
        self.image = name
        self.selectedImage = "selected\(name)"
    }
}
