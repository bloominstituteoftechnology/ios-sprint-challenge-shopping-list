//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
class ShoppingListController {
    
    var shoppingList: [ShoppingItem] = []
    
    
    init() {
        
        loadFromPersistentStore()
        checkList()
            
    }
    

  
        

    func checkList() {
        
        if shoppingList == [] as! [ShoppingItem] {
            
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            
            var newArray: [ShoppingItem] = []
            
            for x in itemNames {
                
                let item = ShoppingItem(itemName: x)
                
                newArray.append(item)
             
             shoppingList = newArray
            }
    
        }
        else {
                return
        }
    }
        

    
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
            try data.write(to: url)
            
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
    
    func toggleAddedToCart(item: ShoppingItem) {
        
        guard let index = shoppingList.firstIndex(of: item) else {return}

        shoppingList[index].addedToCart = !shoppingList[index].addedToCart
        
        saveToPersistentStore()
        
        
        
    }
    
    

    
}
