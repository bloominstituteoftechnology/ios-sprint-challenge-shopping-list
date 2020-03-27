//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Matthew Martindale on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasBeenAddedToCart: Bool
    
    var itemImage: UIImage {
        return UIImage(named: name)!
    }
    
    init(name: String, hasBeenAddedToCart: Bool = false) {
        self.name = name
        self.hasBeenAddedToCart = hasBeenAddedToCart
    }
}
