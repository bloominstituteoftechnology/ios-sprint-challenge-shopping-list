//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Alex on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {
    var items: [Shopping] = []
    
    func create(item: Shopping){
        items.append(item)
    }
    
}
