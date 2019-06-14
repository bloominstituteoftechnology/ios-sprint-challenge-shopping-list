//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Thoai Le on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}
