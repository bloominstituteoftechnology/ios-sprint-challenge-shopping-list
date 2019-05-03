//
//  ShoppingController.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController {

    init() {
        
        userDefaultSetUp()

    }

    private(set) var shoppingItems: [ShoppingItem] = []
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

    var likedItems: [ShoppingItem] {
        return shoppingItems.filter { ( $0.isliked == true )}
    }

    var notLikedItems: [ShoppingItem] {
        return shoppingItems.filter {($0.isliked == false)}
    }



    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

        return document.appendingPathComponent("sprint2.plist")
    }

    func create() {
        for item in itemNames {
            guard let image = UIImage(named: item),
                let imageData = image.pngData() else { return }
                let newItem = ShoppingItem(name: item, image: imageData)
            shoppingItems.append(newItem)
        }
        UserDefaults.standard.set(true, forKey: "user")
        saveToPersistenceStore()
    }

    func update(shoppingItem: ShoppingItem, name: String, isliked: Bool) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }

        shoppingItems[index].name = name
        shoppingItems[index].isliked = isliked
        
        saveToPersistenceStore()
    }

    func saveToPersistenceStore() {
      guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()

        do {
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving to Persistence Store: \(error)")
        }
    }

    func loadFromPersistentStore() {
        guard let url = shoppingListURL, FileManager.default.fileExists(atPath: url.path) else { return }

        let decoder = PropertyListDecoder()

        do {
            let data = try Data(contentsOf: url)
           shoppingItems =  try decoder.decode([ShoppingItem].self, from: data)

        } catch {
            NSLog("Error loading from PersistentSore: \(error)")
        }
    }

    func toggleHasBeenLiked(shoppingItem: ShoppingItem) {

        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].isliked.toggle()
        saveToPersistenceStore()

    }

    func userDefaultSetUp() {
        let userDefault = UserDefaults.standard
        let user = userDefault.bool(forKey: "User")

        if user {
            loadFromPersistentStore()
        } else {
            create()

        }

    }


}

