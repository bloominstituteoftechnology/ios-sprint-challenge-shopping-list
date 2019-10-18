//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    
    var itemName: String
    var added: Bool
    var imageData: Data
    
    init(itemName: String, added: Bool, image: Data) {
        self.itemName = itemName
        self.added = added
        self.imageData = image
    }
}
