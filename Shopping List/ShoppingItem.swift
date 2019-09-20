//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dennis on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var name: String
    var beenAdded: Bool = false
    var itemImage: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
        self.itemImage = UIImage(named: imageName)!
    }
}
