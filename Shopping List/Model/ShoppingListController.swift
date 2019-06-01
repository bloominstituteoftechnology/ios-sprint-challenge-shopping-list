//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
class ShoppingListController {
    
    init() {
        
        loadFromPersistentStore()
        
    }
    
    //Data Arrays
    private var shoppingList: [ShoppingItem] = []
    
    let itemNames = [
        ShoppingItem(itemName: "Apple"),
        ShoppingItem(itemName: "Grapes"),
        ShoppingItem(itemName: "Milk"),
        ShoppingItem(itemName: "Muffins"),
        ShoppingItem(itemName: "Popcorn"),
        ShoppingItem(itemName: "Soda"),
        ShoppingItem(itemName: "Strawberries")
        
    ]
    
    
    //MARK: SAVING FILES
    private var persistentFileURL : URL?{
    
    let fm = FileManager.default
    
    guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
    return documents.appendingPathComponent("shoppingList.plist")
    
    }
    
    
    
    
    
        

    
    func saveToPersistentStore(){
        guard let url = persistentFileURL else {return}
        
        
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            let itemNameData = try encoder.encode(itemNames)
            
            try data.write(to: url)
            try itemNameData.write(to: url)
            
        } catch {
            
            NSLog("Error saving: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else {return}
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
            
        } catch {
            
            NSLog("Error saving: \(error)")
        }
        
    }
    //SAVING ENDS
    
    //MARK: RemoveFromCart is where I stopped!!!!!!!!!
    func addToCart(itemToAdd: ShoppingItem) {
    
        shoppingList.append(itemToAdd)
            
        saveToPersistentStore()
        
    }
    
    func removeFromCart(itemToRemove: ShoppingItem) {
        
        //I have a feeling that this is wrong
        shoppingList.remove(at: itemNames.count)
        
        saveToPersistentStore()
        
    }
}
