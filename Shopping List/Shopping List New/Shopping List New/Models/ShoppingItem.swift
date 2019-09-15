//
//  ShoppingItem.swift
//  Shopping List New
//
//  Created by Uptiie on 9/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var imageName: String
    var itemName: String
    var wasAdded: Bool
    
    init(itemName: String, wasAdded: Bool = false ) {
        self.imageName = itemName
        self.itemName = itemName
        self.wasAdded = wasAdded
    }
    
}
