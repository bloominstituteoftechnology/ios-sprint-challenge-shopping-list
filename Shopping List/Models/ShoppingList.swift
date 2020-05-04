//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Ian French on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



struct ShopList: Equatable, Codable {
    var item: String
    var itemAdd: Bool
    
    init(item: String) {
        self.item = item
        itemAdd = false
    }
    
    
}
