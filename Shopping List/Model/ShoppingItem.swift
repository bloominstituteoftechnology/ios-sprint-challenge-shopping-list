//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var itemSelected: Bool
    var image: UIImage {
        return UIImage(named: name)!
    }
        
    
    init(name: String, itemSelected: Bool = false) {
        self.name = name
        self.itemSelected = itemSelected
        
    }
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
}
