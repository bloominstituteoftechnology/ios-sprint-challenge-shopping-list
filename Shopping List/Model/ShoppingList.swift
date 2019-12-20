//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Michael on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingList: Equatable {
    static func == (lhs: ShoppingList, rhs: ShoppingList) -> Bool {
        
        return true
    }
    
    var itemName: String
    var itemAdded: Bool
    var itemImage: UIImage
    
    
    init(itemName: String, itemAdded: Bool = false, imageName: String) {
        self.itemName = itemName
        self.itemAdded = itemAdded
        self.itemImage = UIImage(named: imageName)!
    
    
    
    }
}
