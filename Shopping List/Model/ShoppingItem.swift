//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dojo on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasAddedItem: Bool
    var imageName: String

    init(name: String, hasAddedItem: Bool = false) {
        self.name = name
        self.imageName = name.lowercased()
        self.hasAddedItem = hasAddedItem
       }

    var image: UIImage?{
    let itemImage = UIImage(named: imageName)
    return itemImage
    }
}
