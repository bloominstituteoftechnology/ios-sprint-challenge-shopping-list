//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController{
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

       var shoppingLists: [ShoppingItem] = []
    
    init() {
        let hasAppBeenOpened = UserDefaults.standard.bool(forKey: .isAddedToCartKey)
           if hasAppBeenOpened {
               loadFromPersistentStore()
           } else {
            UserDefaults.standard.set(true, forKey: .isAddedToCartKey)
               for item in itemNames {
                let shoppingItem = ShoppingItem(name: item, addedItem: false)
                   shoppingLists.append(shoppingItem)
               }
               saveToPersistentStore()
           }
       }
    
//    var shoppingLists: [ShoppingItem] = []
//
//    func createShoppingList(shoppingList: ShoppingItem){
//        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
//
//        for items in itemNames{
//            let myShoppingList = ShoppingItem(name: items, addedItem: false)
//            shoppingLists.append(myShoppingList)
//
//            saveToPersistentStore()
//        }
        
//         var isAddedtoCart = UserDefaults.standard.bool(forKey: .isAddedToCartKey)
//        if isAddedtoCart == false{
//            isAddedtoCart = true
//        }
    
    
//    init() {
//        print("this is dir: \(persistentFileURL!)")
//        loadFromPersistentStore()
//    }
}



    extension ShoppingItemController {
    
    private var persistentFileURL: URL? {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let filename = "ShoppingList.plist"
        return dir?.appendingPathComponent(filename)
//           let fileManager = FileManager.default
//           guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask , appropriateFor: nil, create: true) else { return nil }
//
//           return documents.appendingPathComponent("ShoppingList.plist")
       }
    
    func saveToPersistentStore() {
     let plistEncoder = PropertyListEncoder()
       do{
           let data = try plistEncoder.encode(shoppingLists)
           guard let url = persistentFileURL else {return}
           
           try data.write(to: url)
       } catch{
           NSLog("error saving to plist or writing data: \(error)")
       }
//        guard let url = persistentFileURL else { return }
//
//        do {
//        let encoder = PropertyListEncoder()
//        let data = try encoder.encode(shoppingLists)
//            try data.write(to: url)
//        } catch {
//            print("Error saving shoppingList data: \(error)")
//        }
    }
    func loadFromPersistentStore() {
                do{
                    guard let url = persistentFileURL else { return }
                    let shoppingListData = try Data(contentsOf: url)
                    self.shoppingLists = try PropertyListDecoder().decode([ShoppingItem].self, from: shoppingListData)
                    
                } catch{
                    NSLog("error with data: \(error)")
                }
//         guard let url = persistentFileURL else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            shoppingLists = try decoder.decode([ShoppingItem].self, from: data)
//        } catch{
//            print("Error loading sHoppingList data: \(error)")
//        }
    }
    
}

