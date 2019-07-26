//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Uptiie on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem {
    let item: String
    var isAdded: Bool
    var imageData: Data
    
    init(item: String, isAdded: Bool = false, imageData: Data) {
        self.item = item
        self.isAdded = false
        self.imageData = imageData
    }
}
