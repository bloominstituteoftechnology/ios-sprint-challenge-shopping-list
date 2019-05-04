//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
        
        createShoppingItem()
        loadFromPersistentStore()
    }
    var shoppingList: [ShoppingItem] = []
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
   

    
    func createShoppingItem() {
        
        for name in itemNames {
        
        guard let image = UIImage(named: name), let imageData = image.pngData() else { return }

        let shoppingItem = ShoppingItem(image: imageData, itemName: name)
        shoppingList.append(shoppingItem)

//        saveToPersistentStore()
        }
    }
    
    func updateHasBeenAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingList.index(of: shoppingItem) else { return }
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
            print("Error saving item: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")

    }
    
}
