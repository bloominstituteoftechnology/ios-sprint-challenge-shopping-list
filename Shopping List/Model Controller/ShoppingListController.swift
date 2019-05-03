//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    // MARK: - Properties
    
    static let defaults = UserDefaults.standard
    
    var groceries = [
        ShoppingItem(itemImage: "apple", itemName: <#T##String#>, itemOrdered: <#T##Bool#>)
    
    
    ]
//    var apples: UIImage = UIImage(named: "apple")!
//    var grapes: UIImage = UIImage(named: "grapes")!
//    var milk: UIImage = UIImage(named: "milk")!
//    var muffin: UIImage = UIImage(named: "muffin")!
//    var popcorn: UIImage = UIImage(named: "popcorn")!
//    var soda: UIImage = UIImage(named: "soda")!
//    var strawberries: UIImage = UIImage(named: "strawberries")!
    

    var groceryItem: [String] {
        let groceryItem = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        return groceryItem
    }
    
    private func saveListOfItems() {
       ShoppingListController.defaults.set(groceries, forKey: "groceryList")
    }
   
}
