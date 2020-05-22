//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    var name: String
    var image: UIImage
    var inCart: Bool
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.inCart = false
    }
}
