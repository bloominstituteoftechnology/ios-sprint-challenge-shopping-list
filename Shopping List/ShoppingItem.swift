//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_201 on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var name: String
    var isAdded: Bool
    var image: UIImage
    
    
    init(name: String, isAdded: Bool, imageName: String) {
        self.name = name
        self.isAdded = isAdded
        self.image = UIImage(named: imageName)!
    }
}
