//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Andrew Dhan on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    init() {
        //Use UserDefaults later to make sure it has been initialized before initializing
        
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        
        for item in itemNames{
            
            guard let image = UIImage(named:item),
                let imageData = UIImagePNGRepresentation(image) else {return}
            
            let newItem = ShoppingItem(imageData: imageData, name: item, isAdded: false)
            shoppingList?.append(newItem)
        }
    }
    
    func toggleAddStatus(forItem item: ShoppingItem) {
        guard var shoppingList = shoppingList,
            let index = shoppingList.index(of: item) else {return}
        
        shoppingList[index].isAdded = !shoppingList[index].isAdded
    }
    
    private(set) var shoppingList: [ShoppingItem]?
}
