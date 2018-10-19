//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var items = [ShoppingItem]()
    
    func create(name: String) {
        let item = ShoppingItem(name: name)
        items.append(item)
        saveData()
    }
    
    var url: URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let fileName = "shoppingItems.json"
        return directory.appendingPathComponent(fileName)
    }
    
    
    func saveData() {
        do {
            guard let url = url else {return}
            let itemsEncoded = try JSONEncoder().encode(items)
            try itemsEncoded.write(to: url)
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    func loadData() {
        do {
            guard let url = url, FileManager.default.fileExists(atPath: url.path) else {return}
            let data = try Data(contentsOf: url)
            let itemsDecoded = try JSONDecoder().decode([ShoppingItem].self, from: data)
            items = itemsDecoded
        } catch {
            print("Error: \(error)")
        }
        
    }
}
