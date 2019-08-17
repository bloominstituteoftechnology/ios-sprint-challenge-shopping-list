//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    private(set) var items: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingitem.plist")
    }
    
    init() {
        
        loadFromPersistentStore()
    }
    
    func createShoppingItem(named itemName: String, imageNamed itemImage: Data, wasAdded wasAddedToList: Bool) -> ShoppingItem {
        
        let item = ShoppingItem(itemName: itemName, wasAddedToList: wasAddedToList, itemImage: itemImage)
        items.append(item)
        saveToPersistentStore()
        return item
        
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving items data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        loadDefaults()
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
    
    func loadDefaults() {
        let loadItems = UserDefaults.standard.bool(forKey: .loadItems)
        guard !loadItems else { return }
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            if let itemImage = UIImage(named: item), let imageData = UIImagePNGRepresentation(itemImage) {
                createShoppingItem(named: item, imageNamed: imageData, wasAdded: false)
            }
        }
        UserDefaults.standard.set(true, forKey: .loadItems)
    }
}
