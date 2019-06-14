//
//  GroceryItem.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct GroceryItem {
    var itemName: String
    var itemImage: UIImage
    var hasBeenAdded: Bool
    
    init(itemName: String, itemImage: UIImage, hasBeenAdded: Bool = false) {
        self.itemImage = itemName
        self.itemImage = itemImage
    }
}


