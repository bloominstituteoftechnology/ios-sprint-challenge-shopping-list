//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    
    //MARK: - Properties
    
    var shoppingItem: [ShoppingItem] = []
    
    var itemsAdded: [ShoppingItem] {
        return shoppingItem.filter( { $0.hasBeenAdded} )
    }
    
    
    //Mark: - Initializer
    
    init() {
        let userDefaults = UserDefaults.standard
        let itemToggleStatusKey = userDefaults.bool(forKey: .itemToggleStatusKey)
        
        
        if itemToggleStatusKey {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            
            for itemName in itemNames {
                createShoppingItems(name: itemName)
            }
            savetoPersistenStore()
            UserDefaults.standard.set(true, forKey: .itemToggleStatusKey)
        }
        
    }
    
    //Mark: Methods
    
    func createShoppingItems(name itemName: String, hasBeenAdeed: Bool = false){
    }
    
    func statusLabelToggle(for item: ShoppingItem) {
        guard let index = shoppingItem.firstIndex(of: item) else { return }
        shoppingItem[index].hasBeenAdded.toggle()
        savetoPersistenStore()
    }
    
    // MARK: - Persistence
    
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return directory.appendingPathComponent("ShoppingList.plist")
    }
    
    
    func savetoPersistenStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItem)
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
            self.shoppingItem = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading \(error)")
        }
        
    }
}

extension String {
    static var itemToggleStatusKey = "itemToggleStatusKey"
}
