//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingController {
    
    let userDefaults = UserDefaults.standard
    
    init(){
        
        //TODO : Try to load from UserDefaults first
        
        loadShoppingItemsFromAssets()
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
    
    func toggleAddedToList(on index: Int){
        shoppingList[index].addedToList = !shoppingList[index].addedToList
    }

}

