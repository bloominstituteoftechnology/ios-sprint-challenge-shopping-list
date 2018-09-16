//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit



struct ShoppingListItem: Equatable, Codable {
    var itemName: String
    var addToList: Bool
    var image: UIImage {
        return UIImage(named: itemName)!
    }

    init(itemName: String, addToList: Bool = false) {
        self.itemName = itemName
        self.addToList = addToList
    }
}


