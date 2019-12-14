//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    let name: String
    var hasBeenAddedToList: Bool = false
    
    init(name: String, hasBeenAddedToList: Bool = false) {
        self.name = name
        self.hasBeenAddedToList = hasBeenAddedToList
    }
}
