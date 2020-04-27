//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation




struct ShoppingList: Encodable, Decodable, Equatable {
    static func == (lhs: ShoppingList, rhs: ShoppingList) -> Bool {
        return lhs.itemName == rhs.itemName && lhs.addedItem == rhs.addedItem
    }
    
    var itemName: String
    var addedItem: Bool = false
//    var image: UIImage

    
}
