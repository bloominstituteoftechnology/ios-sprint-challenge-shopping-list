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
    init() {
        //set up stuff, if never been initialized before
        isInitialized = UserDefaults.standard.bool(forKey: setupKey)
        if(isInitialized == false){
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            
            for item in itemNames{
                
                guard let image = UIImage(named:item),
                    let imageData = UIImagePNGRepresentation(image) else {return}
                
                let newItem = Item(name: item, image: imageData)
                shoppingItems.append(newItem)
            }
            UserDefaults.standard.set(true, forKey: setupKey)
        }
        //set user default to reflect that it has been set up.
        loadFromPersistence()
    }
    
    func updateIsAdded(item: Item){
        guard let index = shoppingItems.index(of: item) else {return}
        shoppingItems[index].isAdded = !shoppingItems[index].isAdded
        saveToPersistence()
    }
    
    func clearCart(){
        for index in 0...shoppingItems.count - 1{
            shoppingItems[index].isAdded = false
        }
    }
    
   
    
    
    //for read section
    var addedItem: [Item]{
        return shoppingItems.filter({$0.isAdded})
    }
    
    var notAddedItem: [Item]{
        return shoppingItems.filter({$0.isAdded == false})
    }

    var shoppingItems = [Item]()
    private let setupKey = "Key"
    private(set) var isInitialized:Bool?
    
}
