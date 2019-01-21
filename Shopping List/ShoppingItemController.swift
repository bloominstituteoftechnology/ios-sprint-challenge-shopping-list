//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Moses Robinson on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
       checkForSameUser()
    }
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    let userDefaults = UserDefaults.standard
    
    func createShoppingList() {
        for name in itemNames {
            guard let image = UIImage(named: name),
                let imageData = image.pngData() else { return }
            let shoppingItem = ShoppingItem(name: name, image: imageData)
            shoppingList.append(shoppingItem)
            
            saveToPersistantStore()
            userDefaults.set(true, forKey: "CheckUser")
        }
    }
    
    func updateIsAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingList.index(of: shoppingItem) else { return }
        shoppingList[index].isAdded.toggle()
        
        saveToPersistantStore()
    }
    
    func saveToPersistantStore() {
        guard let url = ShoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let shoppingListData = try encoder.encode(shoppingList)
            try shoppingListData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistantStore() {
        guard let url = ShoppingListURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingList = decodedShoppingList
        } catch {
            print(error)
        }
    }
    
    func checkForSameUser() {
        let sameUser = userDefaults.bool(forKey: "CheckUser")
        
        if sameUser {
            loadFromPersistantStore()
        }
    }
    
    //MARK: - properties
    
    private var ShoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let finalURL = documentsDirectory.appendingPathComponent("ShoppingList.plist")
        return finalURL
    }
    
    var addedShoppingList: [ShoppingItem] {
        let added = shoppingList.filter { $0.isAdded == true }
        return added
    }
    
    private(set) var shoppingList: [ShoppingItem] = []
}
