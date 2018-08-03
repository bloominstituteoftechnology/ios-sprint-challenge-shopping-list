//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingController {
    func saveToPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: url)
        } catch {
            NSLog("\(error)")
        }
    }

    func loadFromPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("\(error)")
        }
    }

    func shoppingItemAddedToList(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList.toggle()
        saveToPersistentStore()
    }

    var inShoppingList: [ShoppingItem] {
        return shoppingItems.filter { $0.addedToList }
    }

    var notInShoppingList: [ShoppingItem] {
        return shoppingItems.filter { !$0.addedToList }
    }

    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDir.appendingPathComponent("ShoppingList.plist")
    }

    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "apple")!)!, name: "apple", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "grapes")!)!, name: "grapes", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "milk")!)!, name: "milk", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "muffin")!)!, name: "muffin", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "popcorn")!)!, name: "popcorn", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "soda")!)!, name: "soda", addedToList: false),
        ShoppingItem(image: UIImagePNGRepresentation(UIImage(named: "strawberries")!)!, name: "strawberries", addedToList: false),
    ]
}
