//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var items = [ShoppingItem]()
    
    func create(name: String) {
        let item = ShoppingItem(name: name)
        items.append(item)
    }
}
