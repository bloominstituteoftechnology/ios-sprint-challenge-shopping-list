//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable {
    var itemName: String
    var wasAddedToList: Bool?
    var itemImage: Data

    init(itemName: String, itemImage: Data) {
        self.itemName = itemName
        self.itemImage = itemImage
    }
}
