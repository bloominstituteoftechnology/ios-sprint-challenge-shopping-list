//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable {
    
    var image: Data
    var title: String
    var isAddedToList: Bool
    
    init(image: Data, title: String) {
        self.image = image
        self.title = title
        self.isAddedToList = false
    }
    
}
