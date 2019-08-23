//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


struct ShoppingItem: Codable {
    var itemName: String
    var added: Bool
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    
    init(itemName: String, added: Bool) {
        self.itemName = itemName
        self.added = added
    }
}
