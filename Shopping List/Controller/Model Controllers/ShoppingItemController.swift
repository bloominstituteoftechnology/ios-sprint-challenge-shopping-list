//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var items = [ShoppingItem]()
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    let defaults = UserDefaults.standard
    
    var persistentFileURL: URL? = {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDirectory.appendingPathComponent("ShoppingList.plist")
    }()
    
    init() {
        loadFromPersistentStore()
        initializeList()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Instance Methods
    
    /// Function to flip the value of the hasBeenAdded property on a single Shopping item
    /// - Parameter item: The ShoppingItem to be changed
    func toggleAdded(for item: ShoppingItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index].hasBeenAdded.toggle()
        saveToPersistentStore()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private Methods
    /// Function to initialize shooping list with initial items
    func initializeList() {
        if defaults.bool(forKey: UserDefaultKeys.itemListSet) {
            return
        } else {
            for name in itemNames {
                let item = ShoppingItem(name: name)
                items.append(item)
                saveToPersistentStore()
                defaults.set(true, forKey: UserDefaultKeys.itemListSet)
            }
        }
    }
    
    /// Function to save ShoppingItems to plist
    func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let itemsData = try encoder.encode(items)
            try itemsData.write(to: fileURL)
        } catch let saveError {
            print("Error saving items to file: \(saveError.localizedDescription)")
        }
    }
    
    /// Function to load ShoppingItems from plist
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let fileURL = persistentFileURL, fileManager.fileExists(atPath: fileURL.path) else { return }
        let decoder = PropertyListDecoder()
        do {
            let itemsData = try Data(contentsOf: fileURL)
            items = try decoder.decode([ShoppingItem].self, from: itemsData)
        } catch let loadError {
            print("Error loading items from file: \(loadError.localizedDescription)")
        }
    }
}
