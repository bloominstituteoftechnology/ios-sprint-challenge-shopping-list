//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var image: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, imageName: String, hasBeenAdded: Bool) {
       
        self.name = name
        self.image = UIImage(named: imageName)!
        self.hasBeenAdded = hasBeenAdded
    }
    
    }

