//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    
    let itemName: String
    var isAdded: Bool = false
    
    init(itemName: String) {
        self.itemName = itemName
    }
}
