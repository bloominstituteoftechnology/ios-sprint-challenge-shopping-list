//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    

    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingList] = []
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingListURL = documentsDirectory?.appendingPathComponent("ShoppingListURL.plist")
        return shoppingListURL
    }


    func saveToPersistentStore () {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNames)
            try data.write(to: shoppingListURL!)
        } catch {
            print("Error")
        }
    }
    
    func loadFromPersistentStore () {
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: shoppingListURL!)
            shoppingList = try decoder.decode([ShoppingList].self, from: data)
        } catch {
            print("Error")
        }
    }
    
    func addedItem(item: ShoppingList) {
    guard let index: Int = shoppingList.firstIndex(of: item) else {return}
    
    shoppingList.remove(at: index)
    saveToPersistentStore()
    }
    
    

}
