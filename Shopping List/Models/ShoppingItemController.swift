//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by alfredo on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

let existKey = "itemsExistKey"
class ShoppingItemController{
    
    //MARK: -Properties
    
    var shoppingItems: [ShoppingItem] = [] //store items
    let itemsExist = UserDefaults.standard.bool(forKey: existKey)
    
    //MARK: -Computed Properties
    
    var addedShoppingItems: [ShoppingItem] {
        return shoppingItems.filter { $0.added }
    }
    var notAddedShoppingItems: [ShoppingItem] {
        return shoppingItems.filter { $0.added == false }
    }
    
    //MARK: -Methods
    
    func itemAddedToggled(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[index].added.toggle()
        saveToPersistentStore()
    }
    func fetchItems() {
        if itemsExist {
            loadFromPersistentStore()
        } else {
            create()
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: existKey)
        }
    }
    
    //MARK: -Persistence
    
    //Create Items
    func create(){
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames{
            let item = ShoppingItem(name: item)
            shoppingItems.append(item)
        }
    }
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("shoppingList-items.plist")
       }
       
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving shoppingItems data: \(error)")
        }
    }
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shoppingItems data: \(error)")
        }
    }
}
