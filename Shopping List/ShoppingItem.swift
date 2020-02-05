//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    var nameOfItem: String
    var addedToList: Bool
    var imageName: String
    var image: UIImage {
        UIImage(named: imageName)!
    }
    
    init(nameOfItem: String, addedToList: Bool = false) {
        self.nameOfItem = nameOfItem
        self.imageName = nameOfItem.lowercased()
        self.addedToList = addedToList
    }
}

//class ShoppingCart: Codable {
//    var itemListed: String
//
//    init(itemListed: String) {
//        self.itemListed = itemListed
//    }
// }
