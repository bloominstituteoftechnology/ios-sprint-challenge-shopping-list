//
//  ItemController.swift
//  Shopping List
//
//  Created by Kobe McKee on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    
    
    
    private(set) var items = [ShoppingItem]()
    var shoppingCart: Int = UserDefaults.standard.integer(forKey: "ItemsInShoppingCart")
    var launched = UserDefaults.standard.bool(forKey: "HasBeenLaunched")
    
    
    
    init(){
        checkIfFirstLaunch()
    }
    

    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ShoppingItems.plist")
    }
    

    
    func checkIfFirstLaunch() {
        if !launched {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                let newItem = ShoppingItem(itemName: item, addedToCart: false)
                items.append(newItem)
            }
            UserDefaults.standard.set(true, forKey: "HasBeenLaunched")
            saveToPersistence()
        } else {
            loadFromPersistence()
        }
    }
  
  
    
    
    func switchItemInCart(item: ShoppingItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index].addedToCart = !items[index].addedToCart
        if items[index].addedToCart == true {
            shoppingCart += 1
        } else {
            shoppingCart -= 1
        }
        saveToPersistence()
    }
    
  
    
    
    func saveToPersistence() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
            UserDefaults.standard.set(shoppingCart, forKey: "ItemsInShoppingCart")
        } catch {
            print("Error saving to disk: \(error)")
        }
    }
    
    
    
    
    func loadFromPersistence() {
        do {
            guard let url = shoppingListURL else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading from disk \(error)")
        }
    }

 
    
}
