//
//  ShoppingItemController.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    //MARK: - Properties
    private(set) var items = [ShoppingItem]()
    
    //create url for persistence
    var fileManagerURL: URL? {
        let fileManager = FileManager.default
        guard let DocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let finalLocation = DocumentDirectory.appendingPathComponent("shoppingList.plist")
        return finalLocation
    }
    
    //MARK: - CRUD Functions
    
    func createItem(item: String, image: String){
        let newItem = ShoppingItem(item: item, image: image)
        items.append(newItem)
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
    }
    
    func addItems(){
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            createItem(item: item, image: item)
            print(item)
        }
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") == true else { return }
        saveToPersistenceStore()
    }
    
    func toggle(item: ShoppingItem){
        item.isAdded = !item.isAdded
        saveToPersistenceStore()
    }
    
    //create an init so that you can call the function that creates the model objects.
    init(){
        addItems()
        loadFromPersistenceStore()
    }
    
    //MARK: - Persistence
    
    func saveToPersistenceStore(){
        //get url
        guard let url = fileManagerURL else { return }
        
        do {
            //create the encoder
            let encoder = PropertyListEncoder()
            
            //turn model into data
           let data =  try encoder.encode(items)
            
            //try to write data to url
            try data.write(to: url)
        } catch  {
            print("Error trying to save to persistence store: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore(){
        //get url
        guard let url = fileManagerURL else { return }
        
        do {
            //create decoder
            let decoder = PropertyListDecoder()
            
            //try to get data from url
           let data = try Data(contentsOf: url)
            
            //assign the array of model objects to our array of model object
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch  {
            print("Error loading from persistence store: \(error.localizedDescription)")
        }
    }
}
