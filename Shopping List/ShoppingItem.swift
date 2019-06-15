//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_101 on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var itemName: String
    var itemAdded: Bool
    var image: UIImage
    
    init(itemName: String, imageName: String, itemAdded: Bool = false) {
        self.itemName = itemName
        self.itemAdded = itemAdded
        self.image = UIImage( named: imageName)!
    }
}
