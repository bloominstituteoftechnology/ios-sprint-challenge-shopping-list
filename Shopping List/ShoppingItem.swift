//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var imageName: String
    var itemName: String
    var hasBeenAdded: Bool
    var itemImage: UIImage
    
}
