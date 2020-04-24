//
//  FoodController.swift
//  Shopping List
//
//  Created by Sherene Fearon on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class FoodController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var foodList = [ShoppingItem(name: "Apple", image: "Apple"),
                    ShoppingItem(name: "Grapes", image:  "Grapes"),
                    ShoppingItem(name: "Milk", image:  "Milk"),
                    ShoppingItem(name: "Muffin", image:  "Muffin"),
                    ShoppingItem(name: "Popcorn", image: "Popcorn"),
                    ShoppingItem(name: "Soda", image:  "Soda")]
                                                             
   


    var addedFoods: [ShoppingItem] {
        let foods = foodList
        let addedFoods = foods.filter{$0.beenAdded == true }
        
        return addedFoods
    }
    
    
    func itemAdded(item: ShoppingItem) {
        guard let itemIndex = foodList.firstIndex(of: item) else { return }
        foodList[itemIndex].beenAdded = !item.beenAdded
    }

}
