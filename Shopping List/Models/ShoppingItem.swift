//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by scott harris on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasBeenAdded: Bool = false
    
    var image: UIImage? {
        guard let image = UIImage(named: name) else { return nil }
        return image
        
    }
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name && lhs.hasBeenAdded == rhs.hasBeenAdded
    }
    
}
