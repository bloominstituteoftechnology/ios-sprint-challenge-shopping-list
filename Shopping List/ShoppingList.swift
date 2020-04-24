//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation




struct ShoppingList: Codable {
    var itemName: String
    var addedItem: Bool
    var image: UIImage? {
        for item in itemNames {
            if item == name {
                return UIImage(named: item)
            }
        }
        return UIImage(named: itemNames[0])
    }
}
