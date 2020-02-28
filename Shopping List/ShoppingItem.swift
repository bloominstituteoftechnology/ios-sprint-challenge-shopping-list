//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var hasBeenAdded: Bool
    var image: UIImage {
        return UIImage(named: name)!
    }
    
    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
    
    
 
   
    
    
}



