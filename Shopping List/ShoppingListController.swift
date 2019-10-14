//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Alex Thompson on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
class ShoppingListController {
    
    private(set) var shoppingList: [ShoppingItems] = []
    
    var notInBasket: [ShoppingItems] {
        let notInBasket = shoppingList.filter { $0.isAdded == false }
        return notInBasket
    }
    
    var inBasket: [ShoppingItems] {
        let inBasket = shoppingList.filter { $0.isAdded == true }
        return inBasket
    }
    
    init() {
        loadDataOnLaunch()
    }
    
    var shoppingListURL: URL? = {
        let fileManager = FileManager()
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")
    }()
    
    func loadDataOnLaunch() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: String.shoppingListKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Popcorn", "Muffin", "Strawberries", "Grapes", "Milk", "Soda", "Apple"]
            for shoppingItems in itemNames {
                shoppingList.append(ShoppingItems(name: shoppingItems))
                
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
            shoppingList = try decoder.decode([ShoppingItems].self, from: data)
        } catch {
            print("Error retrieving Shopping List from file: \(error)")
        }
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingData = try encoder.encode(shoppingList)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving Shopping List to file: \(error)")
        }
    }
    func shoppingItemToggle(for item: ShoppingItems) {
        guard let itemIndex = shoppingList.firstIndex(of: item) else { return }
        shoppingList[itemIndex].isAdded.toggle()
        saveToPersistentStore()
    }
}
