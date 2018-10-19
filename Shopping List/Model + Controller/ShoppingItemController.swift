//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {

    // create array
    // persistence
    // create func
    // load items func
    // user defaults

    private(set) var shoppingItems: [ShoppingItem] = []
    
    // create the list
    func createShoppingItems(name: String, isSelected:Bool, imageData:Data) {
        let shoppingItem = ShoppingItem(name: name, isSelected: isSelected, imageData: imageData)
        shoppingItems.append(shoppingItem)
    }
    
    // update on list
    
    var itemsOnList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItems) -> Bool in
            return shoppingItems.isSelected
        }
    }
    
    // delete off list
    
    var itemsOffList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItems) -> Bool in
            return !shoppingItems.isSelected
        }
    }
    
    // load the images
    func loadShoppingItems() {
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            if let image = UIImage(named: item), let imageData = image.pngData()
            { createShoppingItems(name: item, isSelected: false, imageData: imageData)
        }
    
    }
        
        
    //incorporate persistence
        var url: URL? {
            guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
            let fileName = "shoppingItems.json"
            return directory.appendingPathComponent(fileName)
        }
        
        func saveShoppingItems() {
            do {
                guard let url = url else {return}
                let itemsEncoded = try JSONEncoder().encode(shoppingItems)
                try itemsEncoded.write(to: url)
            } catch {
                print("Error: \(error)")
            }
            
        }
        
        func loadShoppingItems() {
            do {
                guard let url = url, FileManager.default.fileExists(atPath: url.path) else {return}
                let data = try Data(contentsOf: url)
                let itemsDecoded = try JSONDecoder().decode([ShoppingItem].self, from: data)
                shoppingItems = itemsDecoded
            } catch {
                print("Error: \(error)")
            }
            
        }
}
    
    
}
