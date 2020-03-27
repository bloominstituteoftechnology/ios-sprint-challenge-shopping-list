//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingItems : [ShoppingItem] = [ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Grapes", hasAdded: false),
                                          ShoppingItem(name: "Milk", hasAdded: false),
                                          ShoppingItem(name: "Muffin", hasAdded: false),
                                          ShoppingItem(name: "Popcorn", hasAdded: false),
                                          ShoppingItem(name: "Soda", hasAdded: false),
                                          ShoppingItem(name: "Strawberries", hasAdded: false),
    ]
    
    //    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var addedItems : [ShoppingItem] {
        return shoppingItems.filter{$0.hasAdded == true}
    }
    var notAddedItems : [ShoppingItem] {
           return shoppingItems.filter{$0.hasAdded == false}
        
    }
    
    init(){
            loadFromPersistentStore()
        }
    
//    func cellTapped(for item : ShoppingItem){
//
//        guard let index = shoppingItems.firstIndex(of : item) else {return}
//        shoppingItems[index]
//    }
    
    func creatItem(name: String, hasAdded: Bool) -> ShoppingItem {
        let item = ShoppingItem(name: name, hasAdded: hasAdded)
        shoppingItems.append(item)
        saveToPersistentStore()
        return item
    }
    
    
    var persistentFileURL : URL?{
         let fileManager = FileManager.default
         guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
         let shoppingListURL = documentsDir.appendingPathComponent("shoppingList.plist")
         return shoppingListURL
     }
    
    func saveToPersistentStore(){
        
        guard let fileURL = persistentFileURL else {return}
        
        do {
            
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: fileURL)
            
        }catch{
            print("Error encoding shoppingItems array: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        
        guard let fileURL = persistentFileURL else {return}
        
        do {
            
            let data = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let shoppingItemsArray = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = shoppingItemsArray
            
        }catch{
            print("Error decoding shoppingList: \(error)")
        }
    }
    
}



