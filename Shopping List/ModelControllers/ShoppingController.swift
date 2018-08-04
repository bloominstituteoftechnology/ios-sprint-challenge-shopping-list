//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController {
    
    init() {
        loadFromPersistentStore()
        if userDefaultsManager.hasShoppingListBeenInitialized == false {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for itemName in itemNames {
                guard let image = UIImage(named: itemName),
                    let imageData = UIImagePNGRepresentation(image) else { return }
                
                createShoppingList(imageData: imageData, name: itemName)
                userDefaultsManager.initShoppingList()
            }
        } else { return }
    }
    
    // MARK: - CRUD methods
    
    // Create items
    func createShoppingList(imageData: Data, name: String, addedToList: Bool = false) {
        let shoppingItem = ShoppingItem(imageData: imageData, name: name)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    
    // Check or uncheck addedToList
    func updateAddedToList(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList = !shoppingItems[index].addedToList
        saveToPersistentStore()
    }
    
    // MARK: - Persistence - (1) create URL, (2) create load and save functions, (3) init() { load function }, (4) add save function to eacch CRUD method
    
    // (2) create load and save functions
    func saveToPersistentStore() { // (a) set url, (b) do-catch block: (i) create instance of encoder, (ii) try to encode [models], (iii) write to url, (iv) log error in catch
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving shopping items: \(error)")
        }
    }
    
    func loadFromPersistentStore() { // (a) set url and check to see if file exists, (b) do-catch block: (i) create data from url, (ii) create instance of decoder, (iii) try decoding data in form [Model].self, setting [models] to data, (iv) log error in catch
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading shopping items: \(error)")
        }
    }
    
    // (1) create URL
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("shoppingList.plist")
    }
    
    // MARK: - Properties
    
    // Read
    
    var shoppingItems = [ShoppingItem]()
    
    // UserDefaults
    let userDefaultsManager = UserDefaultsManager()
    
}
