//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var hasBeenAdded: Bool = false
    var image: UIImage {
        get {
            return UIImage(named: name)!
        }
    }
    
//    init(name: String, imageName: String, hasBeenAdded: Bool = false) {
//        self.name = name
//        self.image = UIImage(named: imageName)!
//        self.hasBeenAdded = hasBeenAdded
//    }
}
