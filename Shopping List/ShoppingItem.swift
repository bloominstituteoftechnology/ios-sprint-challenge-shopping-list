//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem  {

//    var name: String
    var image: UIImage
    var hasBeenAdded: Bool
    
    init (itemNames: String, hasBeenAdded: Bool = false) {
//        self.name = name
        self.image = UIImage(named: itemNames)!
        self.hasBeenAdded = hasBeenAdded
    }
    
}


