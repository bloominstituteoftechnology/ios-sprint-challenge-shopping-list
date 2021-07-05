//
//  GroceryListController.swift
//  Shopping List
//
//  Created by Austin Potts on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ListController {
    
    
    
    var items: [ShoppingItem] = [// ShoppingItem(name: "Apples", imageName: #imageLiteral)),
                                // ShoppingItem(name: "Grapes", imageName: #imageLiteral(resourceName: "Grapes")),
                                // ShoppingItem(name: "Milk", imageName: #imageLiteral(resourceName: "Milk")),
                                // ShoppingItem(name: "Muffin", imageName: #imageLiteral(resourceName: "Muffin")),
                                // ShoppingItem(name: "Popcorn", imageName: #imageLiteral(resourceName: "Popcorn")),
                                // ShoppingItem(name: "Pop", imageName: #imageLiteral(resourceName: "Soda")),
    ]
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        
        
        return documents.appendingPathComponent("grocery.plist")
    }
    
    //Create method
    func addedItem(name: String, image: UIImage){
        let item = ShoppingItem(name: name, imageName: image)
        items.append(item)
        saveToPersistentStore()
        
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }

    
    
    
    }

