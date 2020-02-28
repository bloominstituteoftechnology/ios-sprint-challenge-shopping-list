//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    var shoppingItems = [ShoppingItems]()
    init() {
        let list = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in list {
            guard let imageData = UIImagePNGRepresentation((UIImage(named: item))!) else {
                return
            }
            let item = ShoppingItems(imageData: imageData, title: item, isAdded: false)
            shoppingItems.append(item)
        }
        loadFromPresistent()
    }
    private var shoppingListURL: URL? {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "ShoppingList.plist"
        return docDir?.appendingPathComponent(fileName)
    }
    
    func saveToPresistent() {
        let encoder = PropertyListEncoder()
        do {
            let shoppingData = try encoder.encode(shoppingItems)
            guard let fileURL = shoppingListURL else {return}
            try shoppingData.write(to: fileURL)
        } catch {
            NSLog("\(error)")
        }
    }
    func loadFromPresistent() {
        do {
            guard let fileURL = shoppingListURL else {
                return
            }
            let shoppingListData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            self.shoppingItems = try decoder.decode([ShoppingItems].self, from: shoppingListData)
        } catch {
            NSLog("\(error)")
        }
    }
    
    func toggle(item: ShoppingItems) {
        guard let index = shoppingItems.index(of: item) else {
            return
        }
        shoppingItems[index].isAdded = !shoppingItems[index].isAdded
        saveToPresistent()
    }
    
    var onShelf: [ShoppingItems] {
        return shoppingItems.filter({$0.isAdded == false})
    }
    var inCart: [ShoppingItems] {
        return shoppingItems.filter({$0.isAdded == true})
    }
    
}
