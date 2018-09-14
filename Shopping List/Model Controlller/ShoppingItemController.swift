//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit



class ShoppingItemController{
    init(){
        persistItem()
    }
    var shoppingItems : [Item] = []
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    
    let itemPreferenceKey = "itemPreference"
    let userDefaults = UserDefaults.standard
    func persistItem(){
        userDefaults.set(shoppingItems, forKey: itemPreferenceKey)
    }
    
    func createShoppingItem(name: String, image: Data) ->[Item] {
        for names in itemNames{
            let shoppingItem = Item(name: names, image: UIImagePNGRepresentation(UIImage(named: names)!)!)
            shoppingItems.append(shoppingItem)
        }
        return shoppingItems
    }
    
    func updateIsAdded(item: Item){
        guard let index = shoppingItems.index(of: item) else {return}
        shoppingItems[index].isAdded = shoppingItems[index].isAdded
        saveToPersistence()
    }
    
    
   
    
    
    //for read section
    var addedItem: [Item]{
        return shoppingItems.filter({$0.isAdded})
    }
    
    var notAddedItem: [Item]{
        return shoppingItems.filter({$0.isAdded == false})
    }

    
    
}
