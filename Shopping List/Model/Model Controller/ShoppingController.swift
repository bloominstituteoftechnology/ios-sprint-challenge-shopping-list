//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingControler {
    
    //MARK: - Properties
    var shoppingItems: [ShoppingItem] = []
    
    private let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
 init(){
    let isInitiated = UserDefaults.standard.bool(forKey: .isInitialized)
        if isInitiated == true {
            loadFromPersistentStore()
        } else {
            createShoppingItem()
        }
    }
    
    //MARK: - CRUD
    //Create:
    func createShoppingItem(){
        for name in itemNames{
            let newItem = ShoppingItem(itemName: name, itemImageName: name)
            shoppingItems.append(newItem)
            saveToPersistentStore()
        }
    }
    
    //MARK: - Persistence
    var persistentFileURL: URL?{
        let fm = FileManager.default
        let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first
        return documents?.appendingPathComponent("items.plist")
    }
    
    func saveToPersistentStore(){
        guard let url = persistentFileURL else { return }
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(self.shoppingItems)
            try data.write(to: url)
        }catch{
            print("Error encoding items to items.plist")
        }
    }
    
    func loadFromPersistentStore(){
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        }catch{
            print("Error decoding items from item.plist")
        }
    }
    
    //MARK: - Helper Functions
    func shoppingItemWasSelected(shoppingItem: ShoppingItem){
        guard let index = shoppingItems.index(of: shoppingItem) else {return}
        var item = shoppingItem
        item.hasBeenAdded = !shoppingItem.hasBeenAdded
        shoppingItems.remove(at: index)
        shoppingItems.insert(item, at: index)
        saveToPersistentStore()
    }
}
