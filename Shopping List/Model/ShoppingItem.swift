//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Aaron Peterson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    var name: String
    var isAdded: Bool = false
    var image: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
}
