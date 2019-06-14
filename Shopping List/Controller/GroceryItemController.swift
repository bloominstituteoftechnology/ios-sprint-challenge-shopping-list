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
    
    var itemList: [String] = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var groceryList: [GroceryItem] = []
    var addedListCount = 0
    
    func loadgroceryList() {
        for item in itemList {
            let groceryItem = GroceryItem(itemName: "\(item)", itemImage: UIImage(named: "\(item)")!)
            groceryList.append(groceryItem)
        }
    }
    
    func toggleAdded(item: GroceryItem) {
        item.hasBeenAdded.toggle()
    }
    
    func groceryAddedCount() -> Int {
        for item in groceryList {
            if item.hasBeenAdded == true {
                addedListCount += 1
                
            }
        }
        return addedListCount
    }
    
    init() {
        loadgroceryList()
    }
}


