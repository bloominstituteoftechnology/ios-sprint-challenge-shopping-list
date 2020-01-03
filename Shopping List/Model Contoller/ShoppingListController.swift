//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation




class ShoppingListController {
    
    
    // MARK: - Properties
    
    var shoppingItem: [ShoppingItem] = []

    
    let shoppingItemIntializedKey = UserDefaults.standard.bool(forKey: .shoppingItemIntializedKey)
    
    var addedToCart: [ShoppingItem] {
        return shoppingItem.filter( { $0.addedToList })
    }
    var notAddedToCart: [ShoppingItem] {
        return shoppingItem.filter( { !$0.addedToList})
    }
    

    
   // MARK: - Initializer
        
        
    func loadItems() {
     if shoppingItemIntializedKey {
            loadFromPersistentStore()
         } else {
           createNewItem()
            savetoPersistenStore()
            UserDefaults.standard.set(true, forKey: .shoppingItemIntializedKey)
            
        }
       
    }

    //MARK: - Functions
    
    func createNewItem() {
        
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
   
        for name in itemNames {
            let item = ShoppingItem(name: name)
            shoppingItem.append(item)
    }
}
    func itemToggled(for item: ShoppingItem) {
          guard let index = shoppingItem.firstIndex(of: item) else { return }

          shoppingItem[index].addedToList.toggle()
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
    static var shoppingItemIntializedKey = "shoppingItemInializedKey"
}


