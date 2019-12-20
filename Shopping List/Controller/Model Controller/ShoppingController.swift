//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Kenny on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    //MARK: Class properties
    var shoppingItems: [ShoppingItem] = []
    
    private let itemNames: [String] = [
        "Apple",
        "Grapes",
        "Milk",
        "Muffin",
        "Popcorn",
        "Soda",
        "Strawberries"
    ]
    
    var itemsToDeliver: [ShoppingItem] {
        return shoppingItems.filter {$0.hasBeenAdded == true}
    }
    
    //MARK: Class Methods
    func update(item: ShoppingItem) {
        for (index, iteratedItem) in shoppingItems.enumerated() where iteratedItem == item {
            #warning("Work out logic to switch this (might be easier once coredata is implemented")
            print(item.hasBeenAdded)
            let newItem = ShoppingItem(name: item.name, hasBeenAdded: true)
            shoppingItems[index] = newItem
        }
    }
    
    init() {
        if shoppingItems.count <= 0 {
            for name in itemNames {
                let item = ShoppingItem(name: name)
                self.shoppingItems.append(item)
            }
        }
    }
    
    
    
    //MARK: FileOps
    

    
    
    var readingList: URL? {
        let fileManager = FileManager.default
       
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        //append books.plist to documentDirectory to create file at path (URL)
        let booksUrl = documentDirectory.appendingPathComponent("books.plist")
        return booksUrl
    }
    
    
    
    
}

