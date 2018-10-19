//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemContorller {

    // create array
    // persistence
    // create func
    // load items func
    // user defaults

    private(set) var shoppingItems: [ShoppingItem] = []
    
    func createShoppingItems(name: String, isSelected:Bool, imageData:Data) {
        let shoppingItem = ShoppingItem(name: name, isSelected: isSelected, imageData: imageData)
        shoppingItems.append(shoppingItem)
        
    }
    
    func loadShoppingItems() {
        
    }
    
    
    
}
