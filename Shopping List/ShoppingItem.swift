//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

struct ShoppingItem: Codable {
    var itemNames: String
    var itemAdded: Bool
    var imageName: String

    init (itemNames: String, itemAdded: Bool = false) {
        self.itemNames = itemNames
        self.itemAdded = itemAdded
        self.imageName = itemNames
}
    
    var itemImage: UIImage {
        return UIImage(named: imageName)!
    }
    
}
