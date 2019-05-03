//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Christopher Aronson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    var persistentURL: URL? {
        
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("items.plist")
    }
    
    var createShoppingItems: [ShoppingItem] {
        
        var result: [ShoppingItem] = []
        let isSaved = UserDefaults.standard.bool(forKey: "isSaved")
        
        if isSaved {
            
            let fileManager = FileManager.default
            guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return [] }
            
            do{
                let decoder = PropertyListDecoder()
                let data = try Data(contentsOf: url)
                return try decoder.decode([ShoppingItem].self, from: data)
            } catch {
                print("Could not load data: \(error)")
            }
            
            let userDefault = UserDefaults.standard
            userDefault.set(true, forKey: "isSaved")
            
        } else {
            result = [ShoppingItem(image: "apple", title: "Apple"),
                          ShoppingItem(image: "grapes", title: "Grapes"),
                          ShoppingItem(image: "milk", title: "Milk"),
                          ShoppingItem(image: "muffin", title: "Muffin"),
                          ShoppingItem(image: "popcorn", title: "Popcorn"),
                          ShoppingItem(image: "soda", title: "Soda"),
                          ShoppingItem(image: "strawberries", title: "Strawberries")]
            
            guard let url = persistentURL else { return [] }
            
            do{
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(result)
                try data.write(to: url)
            } catch {
                print("Error saving data: \(error)")
            }
        }
        
        return result
    }
    
    lazy var shoppingItems: [ShoppingItem] = createShoppingItems
    
    func updateAdded(item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        var updatedItem = item
        updatedItem.added = !updatedItem.added

        shoppingItems[index].added = false
    }
    
}
