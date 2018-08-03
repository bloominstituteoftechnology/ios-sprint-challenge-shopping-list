//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController
{
    //MARK: - Properties
    
    private(set) var shoppingItems = [ShoppingItem]()
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    private var persistentFileURL: URL?
    {
        let fm = FileManager.default
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDirectory.appendingPathComponent("shoppingItems.plist")
    }
    
    //MARK: - Model helper functions
    
    func addShoppingItem(with name: String, imageData: Data)
    {
        let shoppingItem = ShoppingItem(name: name, imageData: imageData, isSelected: false)
        shoppingItems.append(shoppingItem)
        saveToPersistence()
    }
    
    func didSelectShoppingItem(on shoppingItem: ShoppingItem)
    {
        if let index = shoppingItems.index(of: shoppingItem)
        {
            shoppingItems[index].isSelected = shoppingItem.isSelected ? false : true
            saveToPersistence()
        }
    }
    
    //MARK: - Check if launched before
    
    init()
    {
        checkIfLaunchedBefore()
    }
    
    private func checkIfLaunchedBefore()
    {
        if !launchedBefore
        {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for item in itemNames
            {
                guard let imageData = UIImagePNGRepresentation(UIImage(named: item)!) else { return }
                let shoppingItem = ShoppingItem(name: item.capitalized, imageData: imageData, isSelected: false)
                shoppingItems.append(shoppingItem)
            }
            saveToPersistence()
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        else
        {
            loadFromPersistence()
        }
    }
    
    //MARK: - Persistence
    
    func saveToPersistence()
    {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving shopping item data: \(error)")
        }
    }
    
    func loadFromPersistence()
    {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading shopping items: \(error)")
        }
        
    }
}

















