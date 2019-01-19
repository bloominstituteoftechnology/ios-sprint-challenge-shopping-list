//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingItemController {
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var shoppingList: [ShoppingItem] = []
    
    var listHelper = ListHelper()
    
    
    init() {
        loadFoodFromAssets()
        loadFromPersistentStore()
    }
    
    
    
    func loadFoodFromAssets() {
        
        if listHelper.listKey != "Added List" {
            for food in itemNames {
                let imageName = food
            
                guard let image = UIImage(named: imageName) else { return }
                let shoppingItem = ShoppingItem(isAdded: false, name: imageName, image: image)
                shoppingList.append(shoppingItem)
            }
        } else {
            print("Out of the initializer")
        }
    
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let finalLocation = documentsDirectory.appendingPathComponent("Shopping-List.plist")
        
        return finalLocation
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let itemsData = try encoder.encode(shoppingList)
            try itemsData.write(to: url)
        } catch {
            print(error)
        }
        
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            let itemsData = try Data(contentsOf: url)
            let decodedItems = PropertyListDecoder()
            shoppingList = try decodedItems.decode([ShoppingItem].self, from: itemsData)
        } catch {
            print(error)
        }
    }
    
   
   /* func update(shoppingItem: ShoppingItem, name: String, isAdded: Bool, image: UIImage) {
        guard let index = shoppingList.index(of: shoppingItem) else { return }
        shoppingList[index].name = name
        shoppingList[index].isAdded = isAdded
        
    }*/
    
    func updateIsAdded(for shoppingItem: ShoppingItem) {
        guard let index = shoppingList.index(of: shoppingItem) else { return }
        
        shoppingList[index].isAdded = !shoppingList[index].isAdded
        
       // listHelper.setThemePreferenceToAddedList()
        saveToPersistentStore()
        
    }
    
    
    var addedItems: [ShoppingItem] {
        let added = shoppingList.filter({ (shoppingItem) -> Bool in
            return shoppingItem.isAdded
        })
        return added
        
    }
    
    var unaddedItems: [ShoppingItem] {
        let unadded = shoppingList.filter ({ (shoppingItem) -> Bool in
            return !shoppingItem.isAdded
        })
        return unadded
    }
   
    
    
    
    

}
