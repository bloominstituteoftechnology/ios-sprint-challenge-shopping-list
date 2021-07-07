//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Shillingford on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem/*: Encodable, Decodable*/ {
    var name: String
    var image: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, imageName: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.hasBeenAdded = hasBeenAdded
    }
}
