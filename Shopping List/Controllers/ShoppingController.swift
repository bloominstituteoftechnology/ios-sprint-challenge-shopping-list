//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingController {
    
    var itemsAdded = 0
    
    init(){
        
        //TODO : Try to load from UserDefaults first
//        if UserDefaults.standard.array(forKey: "shoppingKey") == nil {
        loadShoppingItemsFromAssets()
//        } else { loadShoppingFromDefaults() }
    }
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var shoppingList : [ShoppingItem] = []
    
    
    func loadShoppingItemsFromAssets(){
        
        for item in itemNames {
            let imageName = item
            guard let image = UIImage(named: imageName) else { return }
            guard let imageData = image.pngData() else { return }
            let shoppingItem = ShoppingItem(imageData: imageData, name: imageName, addedToList: false)
            shoppingList.append(shoppingItem)
        }
    }
    
    func loadShoppingFromDefaults(){
        guard let persistedList = UserDefaults.standard.array(forKey: "shoppingKey") else { return }
        for item in persistedList {
            let imageName = item
            guard let image = UIImage(named: imageName as! String) else { return }
            guard let imageData = image.pngData() else { return }   }
    
    }
    
    func toggleAddedToList(on index: Int){
        shoppingList[index].addedToList = !shoppingList[index].addedToList
        itemsAdded += 1
    }

}

