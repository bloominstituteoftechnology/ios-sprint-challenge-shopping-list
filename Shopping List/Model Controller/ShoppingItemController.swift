//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hayden Hastings on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
        initCheck = UserDefaults.standard.bool(forKey: forKey)
        for item in itemNames {
            if let image = UIImage(named: item) {
                let shoppingList = ShoppingItem(itemName: item, name: item, hasBeenAdded: false)
                shoppingItem.append(shoppingList)
            }
        }
        UserDefaults.standard.set(true, forKey: forKey)
    }
    
    func update(item: ShoppingItem) {
        guard let index = shoppingItem.firstIndex(of: item) else { return }
        shoppingItem[index].hasBeenAdded = !shoppingItem[index].hasBeenAdded
        saveToPersistantStore()
    }
    
    func loadFromPersistantStore() {
        // make sure file exists
        let fileManager = FileManager.default
        guard let url = persistantURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItem = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    func saveToPersistantStore() {
        
        guard let url = persistantURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItem)
            try data.write(to: url)
            
        } catch {
            print("Error saving to persistant store. \(error)")
        }
    }
    
    private var persistantURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        
        return documents.appendingPathComponent("shoppinglist.plist")
    }
    private(set) var initCheck: Bool?
    
    var selectedItems: [ShoppingItem] {
        return shoppingItem.filter { $0.hasBeenAdded == true }
    }
    
    let forKey = "ShoppingList"
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItem: [ShoppingItem] = []
    
    
}
