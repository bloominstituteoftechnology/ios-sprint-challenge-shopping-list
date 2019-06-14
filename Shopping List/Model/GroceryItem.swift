//
//  GroceryItem.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class GroceryItem {
    var itemName: String
    var itemImage: UIImage
    var hasBeenAdded: Bool = false
    
    init(itemName: String, itemImage: UIImage) {
        self.itemName = itemName
        self.itemImage = itemImage
    }
}


