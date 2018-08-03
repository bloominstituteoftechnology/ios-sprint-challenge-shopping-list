//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {
    init(image: Data, name: String, addedToList: Bool) {
        self.image = image
        self.name = name
        self.addedToList = addedToList
    }
    
    var image: Data
    var name: String
    var addedToList: Bool
}
