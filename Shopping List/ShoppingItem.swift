//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

struct ShoppingItem: Codable  {
    var name: String
    var image: UIImage
    var isLiked: Bool

    init(name: String, image: String, isLiked: Bool = false) {
        self.name = name
        self.image = UIImage(named: image)!
        self.isLiked = isLiked
    }
}
