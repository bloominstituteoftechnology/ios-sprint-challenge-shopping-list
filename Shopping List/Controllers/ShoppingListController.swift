//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    
    init() {
    loadFromPersistantStore()
    }
    func updateHasBeenAdded(shoppingList: ShoppingList) {
        guard let index = shoppingLists.index(of: shoppingList) else { return }
        shoppingLists[index].hasBeenAdded.toggle()
        
        saveToPersistantStore()
    }
    func createShoppingList(imageData: Data, title: String) {
        let shoppingList = ShoppingList(imageData: imageData, title: title)
        shoppingLists.append(shoppingList)
    }
    func updateShoppingList(shoppingList: ShoppingList, imageData: Data, title: String) {
        guard let index = shoppingLists.index(of: shoppingList) else { return }
        shoppingLists[index].imageData = imageData
        shoppingLists[index].title = title
    }
   
    func saveToPersistantStore() {
        guard let url = shoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let shoppingListData = try encoder.encode(shoppingLists)
            try shoppingListData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistantStore() {
        guard let url = shoppingListURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedshoppingLists = try decoder.decode([ShoppingList].self, from: data)
            shoppingLists = decodedshoppingLists
        } catch {
            print(error)
        }
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let finalURL = documentsDirectory.appendingPathComponent("shoppingList.plist")
        return finalURL
    }
    
    var addedShoppingItems: [ShoppingList] {
        let added = shoppingLists.filter { $0.hasBeenAdded == true }
        return added
    }
    
    var notAddedShoppingItem: [ShoppingList] {
        let notAdded = shoppingLists.filter { $0.hasBeenAdded == false }
        return notAdded
    }
    var shoppingLists: [ShoppingList] = [] 
        
        
    }

