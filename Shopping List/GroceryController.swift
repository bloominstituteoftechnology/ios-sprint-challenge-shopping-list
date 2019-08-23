//
//  GroceryController.swift
//  Shopping List
//
//  Created by brian vilchez on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class GroceryController {
    private(set) var groceryItems: [GroceryItem] = []
    private let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var checkoutCart: [GroceryItem] {
       return groceryItems.filter({$0.hasBeenAdded == true })
     
    }
    
    init() {
        
        loadFromPersistentStore()
        for item in itemNames {
            if let image = UIImage(named: item) {
                if let ImageData = image.pngData() {
                    addGroceryItem(withName: item, ImageData)
                }
            }
        }
    }
    
    func addGroceryItem(withName name:String, _ image: Data) {
        let groceryItem = GroceryItem(groceryItem: name, groceryitemImage: image)
        groceryItems.append(groceryItem)
        saveToPersistentStore()
    }
    
    func scheduleDelivery(for person:String, to address: String) -> UIAlertController {
        let alert = UIAlertController(title: "Order Recieved", message:"\(person) your \(checkoutCart.count) items are being delivered to the address \(address)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
       return alert
    }
    func updateHasBeenAdded(for groceryItem: GroceryItem) {
        guard let index = groceryItems.firstIndex(of: groceryItem) else {return}
        groceryItems[index].hasBeenAdded = !groceryItems[index].hasBeenAdded
       saveToPersistentStore()
    }
    
}
extension GroceryController {
    var groceryItemURL: URL? {
        let fileManager = FileManager.default
        guard let documentDirectoy = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documentDirectoy.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = groceryItemURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(groceryItems)
            try data.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = groceryItemURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
           self.groceryItems = try decoder.decode([GroceryItem].self, from: data)
        } catch {
            print("Error loading books data: \(error)")
        }
    }
    
}
