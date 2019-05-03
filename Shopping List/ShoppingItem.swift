//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

//model
struct ShoppingItem: Equatable, Codable {
    var name: String
    var imageData: Data?
    var title: String
    var isAddedToList: Bool
    
    init(name: String, title: String) {
        self.name = name
        self.title = title
        self.isAddedToList = false
    }
    
}
