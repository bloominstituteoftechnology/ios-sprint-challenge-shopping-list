//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable {
    var itemName: String
    var addToList: Bool
    var image: UIImage
    
    init(itemName: String, addToList: Bool, imageName: String) {
        self.itemName = itemName
        self.addToList = addToList
        self.image = UIImage(named: itemName)!
    }
}

// let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

