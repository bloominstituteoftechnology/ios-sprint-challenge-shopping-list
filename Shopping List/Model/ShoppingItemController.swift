//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import Foundation

class ShoppingItemController {

  
   var newItems: [ShoppingItem] = [ShoppingItem(name: "Apple", didAdded: false),
                                                 ShoppingItem(name: "Grapes", didAdded: false),
                                                 ShoppingItem(name: "Milk", didAdded: false),
                                                 ShoppingItem(name: "Muffin", didAdded: false),
                                                 ShoppingItem(name: "Popcorn", didAdded: false),
                                                 ShoppingItem(name: "Soda", didAdded: false),
                                                 ShoppingItem(name: "Strawberries", didAdded: false)]

    var addedItems: [ShoppingItem] {
        newItems.filter { $0.didAdded == true }
    }
    
    var removedFromList: [ShoppingItem]{
           return newItems.filter({ $0.didAdded == false })
       }
    
    func updateList(for item: ShoppingItem){
        guard let item = newItems.firstIndex(of: item) else { return }
        newItems[item].didAdded = !newItems[item].didAdded
        saveToPersistentStore()
    }
    
//    func updateList(for item: ShoppingItem){
//        guard let item = newItems.firstIndex(of: item) else { return }
//        newItems[item].addedItems = !newItems[item].addedItems
//        saveToPersisentStore()
//    }

    init() {
            loadFromPersistentStore()
    }
    
    func createItem(name: String, didAdded: Bool ) {
          let shoppingLists = ShoppingItem(name: name, didAdded: didAdded)
          newItems.append(shoppingLists)
          saveToPersistentStore()
      }
    
    var itemListURL: URL? {
          let fileManager = FileManager.default
          guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
          let listURL = documentsDirectory.appendingPathComponent("ShoppingList.plist")
          return listURL
      }
    
    func loadFromPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let data = try Data(contentsOf: url)
            newItems = try PropertyListDecoder().decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items: \(error)")
        }
    }

    func saveToPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let itemsData = try PropertyListEncoder().encode(newItems)
            try itemsData.write(to: url)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    
    
}


  

