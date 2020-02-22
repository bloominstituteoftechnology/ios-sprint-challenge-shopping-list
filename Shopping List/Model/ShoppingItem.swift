//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kendra McVay on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem {
var name: String
var addedToList: Bool = false
var image: UIImage? {
    let itemImage = UIImage(named: name)
    return itemImage
    }
init(name: String, addedToList: Bool = false) {
    self.name = name
    self.addedToList = addedToList
}
    }
    

