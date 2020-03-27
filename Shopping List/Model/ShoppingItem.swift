//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var isAdded: Bool
    var image: UIImage {
        return UIImage(named: name)!
    }
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
    }
}



