//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItems: Codable, Equatable {
    var name: String
    var hasBeenAdded: Bool
    var imageName: String
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
        self.hasBeenAdded = false
    }
}

