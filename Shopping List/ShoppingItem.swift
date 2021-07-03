//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Keri Levesque on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable{
    let name: String
    var addedToList: Bool
    
    init(name: String, addedToList: Bool = false) {
        self.name = name
        self.addedToList = addedToList
    }
}
