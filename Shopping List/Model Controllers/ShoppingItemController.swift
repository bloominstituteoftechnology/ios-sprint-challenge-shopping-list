//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vijay Das on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// work to be done here:
// - create the array
// itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

protocol ShoppingItemCollectionViewCellDelegate: class {
    func tapIsAddedButton(on cell: ShoppingItemCollectionViewCell)
}


class ShoppingItemController {
    
    var shoppingItems = [
        ShoppingItem(item: "apple", imageName: "apple", isAdded: false),
        ShoppingItem(item: "grapes", imageName: "grapes", isAdded: false),
        ShoppingItem(item: "milk", imageName: "milk", isAdded: false),
        ShoppingItem(item: "muffin", imageName: "muffin", isAdded: false),
        ShoppingItem(item: "popcorn", imageName: "popcorn", isAdded: false),
        ShoppingItem(item: "soda", imageName: "soda", isAdded: false),
        ShoppingItem(item: "strawberries", imageName: "strawberries", isAdded: false)
    
    ]
    
    func numberOfItems() -> Int {
        return shoppingItems.count
    }
    
    func item(for indexPath: IndexPath) -> ShoppingItem {
        return shoppingItems[indexPath.row]
    }
    
    func isAddedToggle(at indexPath: IndexPath) {
        shoppingItems[indexPath.row].isAdded.toggle()
    }
    
}
     
    
    
    
    
    
    
    
    






