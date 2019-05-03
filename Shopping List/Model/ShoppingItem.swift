//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var image: UIImage
    var itemName: String
    var addedToList: Bool
    
    init(imageName: String, itemName: String, addedToList: Bool) {
        self.image = UIImage(named: imageName)!
        self.itemName = itemName
        self.addedToList = addedToList
    }
}
