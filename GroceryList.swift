//
//  GroceryList.swift
//  Shopping List
//
//  Created by Austin Potts on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Item {
    var name: String
    var image: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
}
