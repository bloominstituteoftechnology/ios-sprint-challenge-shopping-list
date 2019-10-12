//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController{
    
    var shoppingList: [ShoppingItem] = []
    
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
    let isAddedtoCart = UserDefaults.standard.bool(forKey: .isAddedToCartKey)
     
    init(){
        if isAddedtoCart{
            for i in itemNames{
                let myShoppingList = ShoppingItem(name: i, addedItem: false)
                shoppingList.append(myShoppingList)
            }
        }
    }

    
    private var persistentFileURL: URL? {
           let fileManager = FileManager.default
           guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask , appropriateFor: nil, create: true) else { return nil }
           return documents.appendingPathComponent("ShoppingList.plist")
       }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shoppingList data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
         guard let url = persistentFileURL else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch{
            print("Error loading sHoppingList data: \(error)")
        }
    }
    
}
