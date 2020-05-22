//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Ian Becker on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var groceryItem: String
    var hasBeenAdded: Bool = false
    
    var image: UIImage {
        return UIImage(named: groceryItem)!
    }
}
