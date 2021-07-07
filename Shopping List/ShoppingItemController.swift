//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bradley Yin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController{
    var items : [ShoppingItem] = []
    
    var shoppingListURL : URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ShoppingList.plist")
    }
    
    init() {
        createItemList()
        loadFromPersistentStore()
        
        print(items)
        print(UserDefaults.standard.bool(forKey: "hasLaunch"))
    }
    
    func createItemList(){
        let userDefault = UserDefaults.standard
        if !userDefault.bool(forKey: "hasLaunch"){
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for itemName in itemNames{
                let newItem = ShoppingItem(name: itemName, hasAdded: false)
                print(newItem)
                items.append(newItem)
            }
            userDefault.set(true, forKey: "hasLaunch")
            saveToPersistentStore()
        }
        
    }
    
    func saveToPersistentStore(){
        guard let url = shoppingListURL else {return}
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: url)
        }catch{
            print("Error saving items: \(error)")
        }
        
        
    }
    
    func loadFromPersistentStore(){
        guard let url = shoppingListURL else {return}
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            items = try decoder.decode([ShoppingItem].self, from: data)
        }catch{
            
        }
    }

}
