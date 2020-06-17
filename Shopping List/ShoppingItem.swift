//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Ufuk Türközü on 20.12.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

class ShoppingItem/*: Codable */ {
    
    var itemName: String
    var itemImage: UIImage
    var hasBeenAdded: Bool
    
    init(itemName: String, itemImageName: String) {
        self.itemName = itemName
        self.itemImage = UIImage(named: itemImageName)!
        self.hasBeenAdded = false
    }

}

