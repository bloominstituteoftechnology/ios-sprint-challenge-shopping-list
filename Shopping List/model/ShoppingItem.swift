//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable, Equatable {
    
    var name: String
    var isAddedToShoppingList: Bool
    
    var itemImage: UIImage? {
        let image = UIImage(named: name)
        
        return image
    }
    
    init(_ name: String, _ isAddedToShoppingList: Bool = false) {
        self.name = name
        self.isAddedToShoppingList = isAddedToShoppingList
    }
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name && lhs.isAddedToShoppingList == rhs.isAddedToShoppingList
    }
}
