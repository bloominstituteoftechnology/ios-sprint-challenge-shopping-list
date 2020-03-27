//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    var shoppingItems: [ShoppingItem] = [
        ShoppingItem(name: "Apple", added: false),
        ShoppingItem(name: "Grapes", added: false),
        ShoppingItem(name: "Milk", added: false),
        ShoppingItem(name: "Muffin", added: false),
        ShoppingItem(name: "Popcorn", added: false),
        ShoppingItem(name: "Soda", added: false),
        ShoppingItem(name: "Strawberries", added: false),
    ]

    
    func addItemToCart(item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[index].added.toggle()
        saveToPersistentStore()
    }
    
    
    init() {
        loadFromPersistentStore()
        checkItems()
    }
    
    
    var shoppingListURL: URL? {
        
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingURL = documentsDir?.appendingPathComponent("ShoppingList.plist")
        
        return shoppingURL
    }
    
    func checkItems() {
            let wasLoaded = UserDefaults.standard.bool(forKey: "loaded")
            if wasLoaded == false {
                print("NOT LOADED")
                let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

                for item in itemNames {
                    createItem(with: item, added: false)

                }
                print("ARRAY COUNT: \(shoppingItems)")
                UserDefaults.standard.set(true, forKey: "loaded")
            }
    }
    
    func saveToPersistentStore() {

        do {
            let encoder = PropertyListEncoder()
            
            let shoppingPlist = try encoder.encode(shoppingItems)
            
            guard let shoppingListURL = shoppingListURL else { return }

            try shoppingPlist.write(to: shoppingListURL)

        } catch {
            print("Unable to run: \(error)")
        }
    }
    
    
    func loadFromPersistentStore() {

        guard let shoppingURL = shoppingListURL else {return}

        let decoder = PropertyListDecoder()

        do {

            let shoppingData = try Data(contentsOf: shoppingURL)
            let shoppingArray = try decoder.decode([ShoppingItem].self, from: shoppingData)

            self.shoppingItems = shoppingArray

        } catch {
            print("An error occured: \(error)")
        }
    }
    
    var pickedItems: [ShoppingItem] {
           let pickedOnes = shoppingItems.filter{ $0.added == true }
           let sortArray = pickedOnes.sorted{ $0.name < $1.name }
           return sortArray
       }
       
       
       var unpickedItems: [ShoppingItem] {
           let unpickedOnes = shoppingItems.filter{ $0.added == false }
           let sortArray = unpickedOnes.sorted{ $0.name < $1.name }
           return sortArray
       }
    
    func createItem(with name: String, added: Bool) {
        let item = ShoppingItem(name: name, added: added)
        shoppingItems.append(item)
        saveToPersistentStore()
    }
    
    func deleteItem(with item: ShoppingItem) {
        if let index = shoppingItems.firstIndex(where: {$0.name == item.name}){
            shoppingItems.remove(at: index)
        }
        saveToPersistentStore()
    }
    
    func updateItem(with item: ShoppingItem) {
    if let index = shoppingItems.firstIndex(where: {$0.name == item.name}){
        if shoppingItems[index].added == false {
            shoppingItems[index].added = true
        } else {
            shoppingItems[index].added = false
        }

    }
    saveToPersistentStore()
}
    
    func didSelectItem(with item: ShoppingItem) {
        if let index = shoppingItems.firstIndex(where: {$0.name == item.name}){
            if shoppingItems[index].added == false {
                shoppingItems[index].added = true
            } else {
                shoppingItems[index].added = false
            }

        }
        saveToPersistentStore()
    }
}
