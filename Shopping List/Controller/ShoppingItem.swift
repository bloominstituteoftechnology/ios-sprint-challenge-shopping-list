//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Samuel Esserman on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    let name: String
    var hasBeenAdded: Bool = false
    var image: UIImage? {
        guard let image = UIImage(named: name) else {return nil}
        return image
    }
    
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
           return lhs.name == rhs.name && lhs.hasBeenAdded == rhs.hasBeenAdded
       }
}

