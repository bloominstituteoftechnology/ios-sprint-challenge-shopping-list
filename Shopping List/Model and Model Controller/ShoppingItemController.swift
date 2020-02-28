//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Andrew Dhan on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    init() {
        //set up stuff, if never been initialized before
        isInitialized = UserDefaults.standard.bool(forKey: setupKey)
        if(isInitialized == false){
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            
            for item in itemNames{
                
                guard let image = UIImage(named:item),
                    let imageData = UIImagePNGRepresentation(image) else {return}
                
                let newItem = ShoppingItem(imageData: imageData, name: item, isAdded: false)
                shoppingList.append(newItem)
            }
            UserDefaults.standard.set(true, forKey: setupKey)
        }
        //set user default to reflect that it has been set up.
        loadFromPersistenceStore()
    }
    
    
    //MARK: - Persistence
    func saveToPersistenceStore(){
        guard let fileURL = fileURL else {return}
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(shoppingList)
            try data.write(to: fileURL)
            
        } catch {
            NSLog("Error encoding")
        }
        
    }
    
    func loadFromPersistenceStore(){
        let fm = FileManager.default
        guard let fileURL = fileURL, fm.fileExists(atPath: fileURL.path) else {return}
        
        let decoder = PropertyListDecoder()
        
        do{
            let data = try Data(contentsOf: fileURL)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error decoding")
        }
    }
    
    func toggleAddStatus(forItem item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].isAdded = !shoppingList[index].isAdded
        
        saveToPersistenceStore()
    }
    //MARK: - Relevant CRUD methods
    func clearCart(){
        for index in 0...shoppingList.count - 1{
            shoppingList[index].isAdded = false
        }
    }
    
        
        //MARK: - Properties
    private(set) var shoppingList = [ShoppingItem]()
        
    var shoppingCart: [ShoppingItem]{
            return shoppingList.filter{$0.isAdded == true }
    }
    var itemsOnShelf: [ShoppingItem]{
            return shoppingList.filter{$0.isAdded == false }
    }
        
    private var fileURL: URL?{
            let fm = FileManager.default
            let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first
            let filename = "ShoppingList.plist"
            return documentDirectory?.appendingPathComponent(filename)
    }
        
        
    private let setupKey = "SetupKey"
    private(set) var isInitialized:Bool?
}
