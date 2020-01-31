//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Enrique Gongora on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingList: [ShoppingItem] = [ShoppingItem(item: "Apple", addedToList: false),
                                        ShoppingItem(item: "Grapes", addedToList: false),
                                        ShoppingItem(item: "Milk", addedToList: false),
                                        ShoppingItem(item: "Muffin", addedToList: false),
                                        ShoppingItem(item: "Popcorn", addedToList: false),
                                        ShoppingItem(item: "Soda", addedToList: false),
                                        ShoppingItem(item: "Strawberries", addedToList: false)]
    
    var addedToList: [ShoppingItem]{
        return shoppingList.filter({ $0.addedToList == true })
    }
    
    var removedFromList: [ShoppingItem]{
        return shoppingList.filter({ $0.addedToList == false })
    }
    
    func updateList(for item: Int){
        shoppingList[item].addedToList.toggle()
        saveToPersisentStore()
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    
    func createItem(name: String, addedToList: Bool ) {
        let shoppingLists = ShoppingItem(item: name, addedToList: addedToList)
        shoppingList.append(shoppingLists)
        saveToPersisentStore()
    }
    
    
    //MARK: - Persistent Storage Functions
    var shoppingListURL: URL?{
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let listURL = documentsDirectory.appendingPathComponent("ShoppingList.plist")
        return listURL
    }
    
    func saveToPersisentStore() {
        guard let fileURL = shoppingListURL else { return }
        do{
            let encoder = PropertyListEncoder()
            let listData = try encoder.encode(shoppingList)
            try listData.write(to: fileURL)
        }catch{
            print("Error encoding shopping list array: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = shoppingListURL else { return }
        do{
            let decoder = PropertyListDecoder()
            let listData = try Data(contentsOf: fileURL)
            let listArray = try decoder.decode([ShoppingItem].self, from: listData)
            self.shoppingList = listArray
        }catch{
            print("Error decoding shopping list: \(error)")
        }
    }
}
