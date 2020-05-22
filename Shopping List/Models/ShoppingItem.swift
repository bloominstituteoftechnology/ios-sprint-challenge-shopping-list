//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var itemName: String
    var isOnList: Bool 
    var itemImage:  UIImage? {
        let itemImageName = "\(itemName).png"
        guard let itemImage = UIImage(named: itemImageName) else {
           return nil
        }
        return itemImage
    }
}



