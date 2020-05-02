//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dawn Jones on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var itemName: String
    var itemAdded: Bool
    var itemImage: UIImage {
        let itemPic = UIImage(named: itemName)
        return itemPic!
    }
}
