//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {
    
    var shoppingList: [ShoppingItem] = []
    var persistentShoppingURL: URL? {
        // Singleton - Single Instance that can be used throughout the app
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func createShoppingList(){
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        if UserDefaults.standard.bool(forKey: "ShoppingItem"){
            
        } else {
            for item in itemNames {
                let shoppingItem = ShoppingItem(name: item)
                shoppingList.append(shoppingItem)
            }
            
            saveToPersistentStore()
        }
        UserDefaults.standard.set(true, forKey: "ShoppingItem")
    }
    
    func updateShoppingList(shoppingItem: ShoppingItem){
     /*   var shoppingItem2 = shoppingItem.addedOnTheShoppingList */
        shoppingItem.addedOnTheShoppingList = !shoppingItem.addedOnTheShoppingList
        
        saveToPersistentStore()
        
      
}
        
        
        
        

    
    init(){
        createShoppingList()
        loadFromPersistentStore()
        
    }
    
    
    
    func saveToPersistentStore() {
        
        // Stars -> Data -> Plist
        guard let url = persistentShoppingURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        // Plist -> Data -> Stars
        let fileManager = FileManager.default
        guard let url = persistentShoppingURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
           print("error loading stars data: \(error)")
        }
    }




}







