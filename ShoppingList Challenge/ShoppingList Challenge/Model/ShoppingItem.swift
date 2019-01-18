//
//  ShoppingItem.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem {
    var item: String
    var isAdded: Bool
    var image: UIImage
    
    init(item: String, isAdded: Bool = true, image: UIImage){
        self.item = item
        self.isAdded = isAdded
        self.image = image
    }
}
