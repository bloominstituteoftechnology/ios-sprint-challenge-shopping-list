//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    var name: String
    var isOnShoppingList: Bool
    
    var image: UIImage? {
        UIImage(named: name)
    }
}
