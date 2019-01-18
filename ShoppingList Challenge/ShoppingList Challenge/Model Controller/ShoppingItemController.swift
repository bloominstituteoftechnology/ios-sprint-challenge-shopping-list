//
//  ShoppingItemController.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    private(set) var items = [ShoppingItem]()
    
    //MARK: - CRUD Functions
    
    func createItem(item: String, image: UIImage){
        let newItem = ShoppingItem(item: item, image: image)
        items.append(newItem)
    }
    
    func addItems(){
        
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for items in itemNames {
            guard let image = UIImage(named: items) else { return }
            createItem(item: items, image: image)
        }
    }
    
    func toggle(item: ShoppingItem){
        item.isAdded = !item.isAdded
    }
 
    //create an init so that you can call the function that creates the model objects.
    init(){
      addItems()
    }
    
    
    //MARK: - Persistence
    let userDefaults = UserDefaults.standard
}
