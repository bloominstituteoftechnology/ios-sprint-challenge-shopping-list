//
//  ShoppingItem.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
    var item: String
    var isAdded: Bool
    var image: String
    
    init(item: String, isAdded: Bool = false, image: String){
        self.item = item
        self.isAdded = isAdded
        self.image = image
    }
}
