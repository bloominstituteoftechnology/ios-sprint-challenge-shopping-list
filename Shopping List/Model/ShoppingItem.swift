//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    let name : String
    var hasAdded: Bool
    
    var image : UIImage {
         return UIImage(named: name)!
    }
    
}
