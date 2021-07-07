//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        if UserDefaults.standard.bool(forKey: "ShoppingKey") {
            loadFromPersistence()
        } else {
            UserDefaults.standard.set(true, forKey: "ShoppingKey")
            self.create(image: "apple", item: "Apple")
            self.create(image: "grapes", item: "Grapes")
            self.create(image: "milk", item: "Milk")
            self.create(image: "muffin", item: "Muffin")
            self.create(image: "popcorn", item: "Popcorn")
            self.create(image: "soda", item: "Soda")
            self.create(image: "strawberries", item: "Strawberries")
        }
    }
    
    func create(image: String, item: String) {
        let shoppingItem = ShoppingItem(image: image, item: item)
        shoppingItems.append(shoppingItem)
        
        saveToPersistence()
    }
    
    func update(shoppingItem: ShoppingItem, image: String, item: String) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var scratch = shoppingItem
        scratch.image = image
        scratch.item = item
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    func updateIsAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var scratch = shoppingItem
        scratch.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    func delete(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems.remove(at: index)
        
        saveToPersistence()
    }
    
    var shoppingItems: [ShoppingItem] = []
    
}
