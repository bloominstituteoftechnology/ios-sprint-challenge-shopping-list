//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    let name: String
    var addedToList: Bool
    
    init(name: String, addedToList: Bool) {
        self.name = name
        self.addedToList = addedToList
    }
}
