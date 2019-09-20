//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jesse Ruiz on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable {
    var name: String
    var imageName: String
    var hasBeenAdded: Bool
    
    init(name: String, imageName: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.hasBeenAdded = false
    }
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
}
