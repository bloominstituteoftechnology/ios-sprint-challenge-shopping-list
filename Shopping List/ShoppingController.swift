//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    var shoppingItems: [ShoppingItem] = []
    
    init() {
        loadFromPersistentStore()
        checkItemsInStock()
   //     emptyPersistentStore()
    }
    
    var shoppingListURL: URL? {
        
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let readingURL = documentsDirectory?.appendingPathComponent("ShoppingList.plist")
        return readingURL
        
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
    /*
    func updateNameOrReasson(with book: Book, title: String? = nil, reason: String? = nil){
        
        if let index = books.firstIndex(where: {$0.title == book.title}){
            if let newTitle = title {
                books[index].title = newTitle
            }
            if let newReason = reason {
                books[index].reasonToRead = newReason
            }
        }
        saveToPersistentStore()
    }
    */
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingPlist = try encoder.encode(shoppingItems)
            guard let shoppingURL = shoppingListURL else {return}
            
            try shoppingPlist.write(to: shoppingURL)
            
        } catch {
            print("Unable to run: \(error)")
        }
    }
    
    func emptyPersistentStore() {
        let encoder = PropertyListEncoder()
        
        let emptyShop: [ShoppingItem] = []
        
        do {
            let shoppingPlist = try encoder.encode(emptyShop)
            guard let shoppingURL = shoppingListURL else {return}
            
            try shoppingPlist.write(to: shoppingURL)
            
            UserDefaults.standard.set(false, forKey: "loaded")
            
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
    
    func checkItemsInStock() {
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
}
