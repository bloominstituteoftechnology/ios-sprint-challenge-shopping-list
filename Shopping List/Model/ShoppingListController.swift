//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Rob Vance on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingList: [ShoppingItem] = [
        ShoppingItem(itemName: "Apples", addToList: false),
        ShoppingItem(itemName: "Grapes", addToList: false),
        ShoppingItem(itemName: "Milk", addToList: false),
        ShoppingItem(itemName: "Muffins", addToList: false),
        ShoppingItem(itemName: "Popcorn", addToList: false),
        ShoppingItem(itemName: "Soda", addToList: false),
        ShoppingItem(itemName: "Strawberries", addToList: false)
    ]
    
    var addToList: [ShoppingItem] {
        return shoppingList.filter({ $0.addToList == true })
    }
    var removeFromList: [ShoppingItem] {
        return shoppingList.filter({ $0.addToList == false })
    }
    
    func updateList(for item: ShoppingItem) {
        guard let item = shoppingList.firstIndex(of: item) else { return }
        shoppingList[item].addToList = !shoppingList[item].addToList
        saveToPersisentStore()
    }
    init() {
        loadFromPersistentStore()
    }
    func createItem(name: String, addToList: Bool) {
        let shoppingLists = ShoppingItem(itemName: name, addToList: addToList)
        shoppingList.append(shoppingLists)
        saveToPersisentStore()
    }
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let docDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let listURL = docDirectory.appendingPathComponent("ShoppingList.plist")
        return listURL
    }
    func saveToPersisentStore() {
        guard let url = shoppingListURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let listData = try encoder.encode(shoppingList)
            try listData.write(to: url)
        } catch {
            print("Error while saving to shopping list: \(error)")
        }
    }
    func loadFromPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let decoder = PropertyListDecoder()
            let listData = try Data(contentsOf: url)
            let listArray = try decoder.decode([ShoppingItem].self, from: listData)
            self.shoppingList = listArray
        } catch {
            print("Error while loading shopping list: \(error)")
        }
    }
    
}
