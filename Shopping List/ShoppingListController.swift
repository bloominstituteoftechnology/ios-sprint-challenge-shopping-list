//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Alex on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {
    var shoppingList: [Shopping] = []
    let userDefaults = UserDefaults.standard
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documentDir.appendingPathComponent("shoppingList.plist")
    }
    
    init() {
        create() // not creating values - being called in wrong place?
        loadFromPersistentStore()
    }

    func create(){
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            shoppingList.append(Shopping(imageName: item, itemName: item))
            saveToPersistentStore()
        }
    }
    
    func toggleAdd(shoppingListItem: Shopping) {
        guard let index = shoppingList.index(of: shoppingListItem) else { return }
        shoppingList[index].addedToList.toggle()
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving to persistent store: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path)  else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppingList = try decoder.decode([Shopping].self, from: data)
        } catch  {
            print("Error loading from persistent store: \(error)")
        }
    }
}
