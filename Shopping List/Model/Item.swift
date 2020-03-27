//
//  Item.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var hasBeenAdded: Bool = false
    
    var image: UIImage? {
        let picture = UIImage(named: name)
        return picture
    }
}
