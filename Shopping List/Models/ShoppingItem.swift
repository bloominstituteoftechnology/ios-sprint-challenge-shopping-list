//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 20/12/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    let name: String
    let image: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, imageName: String, hasBeenAdded: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.hasBeenAdded = hasBeenAdded
    }
}
