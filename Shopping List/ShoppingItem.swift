//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

struct ShoppingItem: Equatable, Codable  {

    var name: String
    var isLiked: Bool

    init(name: String, isLiked: Bool = false) {
        self.name = name
        self.isLiked = isLiked
        var image: UIImage {
            return UIImage(named: name)!
        }
    }
}
