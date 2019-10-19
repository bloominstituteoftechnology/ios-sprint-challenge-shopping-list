//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingList: [ShoppingItem] = []
    let listExists = UserDefaults.standard.bool(forKey: .shouldShowShoppingList)
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    func createShoppingList() {
        for itemName in itemNames {
            print(itemName)
            let listItem = ShoppingItem(itemName: itemName)
            shoppingList.append(listItem)
        }
    }
    
    init() {
        createShoppingList()
    }
    
    // MARK: - Private Methods
    
    private func loadFromPersisitentStore() {

        do {
            guard let fileURL = shoppingListURL else { return }
            let shoppingListData = try Data(contentsOf: fileURL)
            let plistDecoder = PropertyListDecoder()
            shoppingList = try plistDecoder.decode([ShoppingItem].self, from: shoppingListData)
        } catch {
            print("Could not load Shopping List: \(error)")
        }
    }

    private func saveToPersistentStore() {
        let plistEncoder = PropertyListEncoder()

        do {
            let shoppingListData = try plistEncoder.encode(shoppingList)
            guard let fileURL = shoppingListURL else { return }
            try shoppingListData.write(to: fileURL)
        } catch {
            print("Could not save Shopping List: \(error)")
        }

    }

    func changeAddedList(forShoppingItem shoppingList: ShoppingItem) {
        shoppingList.isAdded = !shoppingList.isAdded
        saveToPersistentStore()
    }

    // MARK: - Properties

    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "ShoppingList.plist"

        return documentDirectory?.appendingPathComponent(fileName)
    }

}
