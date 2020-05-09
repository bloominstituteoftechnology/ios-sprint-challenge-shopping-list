//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Shopping: Equatable, Codable {
    var imageName: String
    var itemName: String
    var addedToList: Bool
    
    init(imageName: String, itemName: String, addedToList: Bool = false) {
        self.imageName = imageName
        self.itemName = itemName
        self.addedToList = addedToList
    }
}
