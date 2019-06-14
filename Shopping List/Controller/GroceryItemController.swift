//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class GroceryItemController {
    
    let itemList: [String] = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var groceryList: [GroceryItem] = []
    
    func loadgroceryList() {
        for item in itemList {
            let groceryItem = GroceryItem(itemName: "\(item)", itemImage: UIImage(named: "\(item)")!)
            groceryList.append(groceryItem)
        }
    }
    
}


