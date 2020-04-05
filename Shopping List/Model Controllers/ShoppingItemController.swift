//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {

    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    var listSet: Bool = false
    let listSetKey = "Key"

    var shoppingListURL: URL? {
        let filemanager = FileManager.default
        let documentsDir = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first
        let itemsURL = documentsDir?.appendingPathComponent("ShoppingList.plist")
        return itemsURL
    }


    


    func createItem(name: String) {
        let item = ShoppingItem(name: name, hasBeenAdded: false)
        shoppingItems.append(item)
        saveView()
    }

    func updateHasBeenAdded(item: ShoppingItem) {
        guard let itemIndex = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[itemIndex].hasBeenAdded = !shoppingItems[itemIndex].hasBeenAdded
        saveView()
    }

    func saveView() {
        do {
            let encoder = PropertyListEncoder()
            let itemsPList = try encoder.encode(shoppingItems)
            guard let shoppingListURL = shoppingListURL else { return }
            try itemsPList.write(to: shoppingListURL)
        } catch let saveError {
            print("Error saving shopping list. \(saveError)")
        }
    }
    
    func loadView() {
        guard let shoppingListURL = shoppingListURL else { return }
    
        do {
            let decoder = PropertyListDecoder()
            let itemsPList = try Data(contentsOf: shoppingListURL)
            let decodedList = try decoder.decode([ShoppingItem].self, from: itemsPList)
            self.shoppingItems = decodedList
        } catch let loadError {
            print("Error loading shopping list. \(loadError)")
        }
    }
    
    func setList() {
        listSet = true
        UserDefaults.standard.set(listSet, forKey: listSetKey)
    }
    
    func loadList() {
        listSet = UserDefaults.standard.bool(forKey: listSetKey)
    }

}
