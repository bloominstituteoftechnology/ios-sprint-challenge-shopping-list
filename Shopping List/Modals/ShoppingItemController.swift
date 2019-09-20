//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingListController {
    
    
     var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "muffin", "Popcorn", "Soda",  "Strawberries"]
    
     var shoppingListItem: [ShoppingListItem] = []
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("Info.plist")
    }
    
    init() {
        let hasAppBeenOpened = UserDefaults.standard.bool(forKey: "hasAppBeenOpened")
        if hasAppBeenOpened {
            loadFromPersistentStore()
        } else {
            UserDefaults.standard.set(true, forKey: "hasAppBeenOpened")
        }
        
        saveToPersistentStore()
    }
    
    
     func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL else {return}
        fm.fileExists(atPath: url.path)
    
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppingListItem = try decoder.decode([ShoppingListItem].self, from: data)
        } catch {
            print("Error loading List data: \(error)")
        }
    }
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingListItem)
            try data.write(to: url)
        } catch {
            NSLog("Error saving Shopping List Data: \(error)")
        }
    }
    
}
