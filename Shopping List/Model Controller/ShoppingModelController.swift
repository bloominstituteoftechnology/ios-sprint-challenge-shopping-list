//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController {
    
    //MARK: -Variables and Constants
    
    let items : Bool = UserDefaults.standard.bool(forKey: .itemListInitializedKey)
    
    
    let itemsNames = ["Apple", "Grapes", "Milk", "Muffin", "Soda", "Strawberries", "Popcorn"]
    
    var shoppingItems : [ShoppingItem] = []
    
    var shoppingListURL : URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        return dir.appendingPathComponent("TheShoppingItemsList.plist")
    }
    
    //MARK: - Initializer
    
    init() {
        if items == false {
            createInitialShoppingItems()
            UserDefaults.standard.set(true, forKey: .itemListInitializedKey)
            print("created \(items)")
        } else {
            loadFromPersistenceStore()
            print("loaded \(items)")
        }
    }
    
    
    //MARK: -Persistence Functions
    
    func createInitialShoppingItems() {
        for item in itemsNames {
            let newItem = ShoppingItem(itemName: item, imageString: item)
            shoppingItems.append(newItem)
        }
        saveToPersistenceStore()
    }
    
    
    func saveToPersistenceStore() {
        guard let url = shoppingListURL else {return}
        do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(shoppingItems)
        try data.write(to: url)
            
        } catch  {
            print("Not able to encode the data")
        }
    }
    
    func loadFromPersistenceStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else {return}
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
                
            } catch  {
                print("Not able to decode the data")
            }
        
    }
    
    //MARK: - Function to Calculate the number of total items added
    
    func calculateTotalAddedItems() -> Int {
        var count = 0
        for item in shoppingItems {
            if item.hasBeenAdded == true {
                count += 1
            }
        }
         return count
    }
    
    
}

    //MARK: -Extension of String Class for Key in User Defaults

extension String {
    static let itemListInitializedKey = "itemListInitializedKey"
    
}

