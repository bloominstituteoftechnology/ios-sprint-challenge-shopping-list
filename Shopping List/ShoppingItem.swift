//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {
    
    var itemName: String
    var hasBeenAdded: Bool
    
    init(itemName: String, hasBeenAdded: Bool = false) {
        self.itemName = itemName
        self.hasBeenAdded = hasBeenAdded
    
//    var image: UIImage
//    var hasBeenAdded: Bool
//
//    init (itemNames: String, hasBeenAdded: Bool = false) {
//
//        self.image = UIImage(named: itemNames)!
//        self.hasBeenAdded = hasBeenAdded
    }
    
}


