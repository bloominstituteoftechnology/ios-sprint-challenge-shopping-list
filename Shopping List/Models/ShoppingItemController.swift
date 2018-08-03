//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    func createItem(with itemImage: Data, itemName: String, hasBeenAdded: Bool = false) {
        
        let shoppingItem = ShoppingItem(itemImage: itemImage, itemName: itemName)
        
        shoppingItems.append(shoppingItem)
    }
    
    func updateItem(with shoppingItem: ShoppingItem, itemImage: Data, itemName: String, hasBeenAdded: Bool = false) {
        
        if let index = shoppingItems.index(of: shoppingItem) {
            shoppingItems[index].itemImage = itemImage
            shoppingItems[index].itemName = itemName
        }
    }
}
