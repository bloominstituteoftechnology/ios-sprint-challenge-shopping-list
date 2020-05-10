//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var itemName: String
    var addedToShoppingList: Bool
    //var itemImage: UIImage
    
    init(name: String, added: Bool = false) {
        self.itemName = name
        self.addedToShoppingList = added
        //self.itemImage = UIImage
    }
}
