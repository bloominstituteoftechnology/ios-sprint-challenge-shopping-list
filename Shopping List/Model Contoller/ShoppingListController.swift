//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol itemInitializedDelegate: AnyObject {
    func itemTapped(_ item: ItemCollectionViewCell)
}

class ShoppingListController {
    
    
    // Mark: - Properties
    
    var itemName: [ShoppingItem] = []
    
    let itemsOnListToPersist = UserDefaults.standard.bool(forKey: .shoppingItemIntializedKey)

    var addedToCart: [ShoppingItem] {
        return itemName.filter { $0.addedToList}
    }
    var notAddedtoCart:[ShoppingItem] {
        return itemName.filter { $0.addedToList}
    }
    
    // Mark: - func
    func itemToggled(for item: ShoppingItem) {
        guard let index = itemName.firstIndex(of: item) else { return }
        
        itemName[index].addedToList.toggle()
    }
    
    func checkforItem() {
        if itemsOnListToPersist {
            loadFromPersistentStore()
        } else {
            createList()
            savetoPersistenStore()
            UserDefaults.standard.set(true, forKey: .shoppingItemIntializedKey)
            
        }
    }
    
    func createList() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            let item = ShoppingItem(name: item)
            itemName.append(item)
        }
    }
    
    // Mark: - Persistence
    
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return directory.appendingPathComponent("ShoppingList.plist")
    }
    
    
    func savetoPersistenStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemName)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
    }
}
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL,
            fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.itemName = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading \(error)")
        }
        
    }
    
}


extension String {
    static var shoppingItemIntializedKey = "shoppingItemInializedKey"
}


