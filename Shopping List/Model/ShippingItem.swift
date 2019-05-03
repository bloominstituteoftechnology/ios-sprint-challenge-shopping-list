//
//  ShippingItem.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    let itemImage: UIImage
    let itemName: String
    let itemOrdered: Bool
    
    init(itemImage: UIImage, itemName: String, itemOrdered: Bool) {
        self.itemImage = itemImage
        self.itemName = itemName
        self.itemOrdered = false
    }
}
