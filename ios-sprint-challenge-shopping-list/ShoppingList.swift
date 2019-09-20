//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Robert B on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
class ShoppingList {
    
    
    private(set) var shoppingList: [ShoppingItem] = []
    
    var notInBasket: [ShoppingItem] {
        let notInBasket = shoppingList.filter { $0.isListed == false }
        return notInBasket
    }
    
    var inBasket: [ShoppingItem] {
        let inBasket = shoppingList.filter { $0.isListed == true }
        return inBasket
    }
    
    
    init() {
        loadDataOnLaunch()
    }
    
    
    var shoppingListURL: URL? = {
        let fileManager = FileManager()
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("shoppinglist.plist")
    }()
    

    func loadDataOnLaunch() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: String.shoppingListKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for shoppingItem in itemNames {
                shoppingList.append(ShoppingItem(name: shoppingItem))
            }
            saveToPersistentStore()
            userDefaults.set(true, forKey: String.shoppingListKey)
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data.init(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error retrieving Shopping List from file: \(error)")
        }
        
    }
    
   
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do{
            let shoppingData = try encoder.encode(shoppingList)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving Shopping List to file: \(error)")
        }
        
    }
    
    func shoppingItemToggle(for item: ShoppingItem){
        guard let itemIndex = shoppingList.firstIndex(of: item) else { return }
        shoppingList[itemIndex].isListed.toggle()
        saveToPersistentStore()
    }
    
}
