//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {

    init () {
        loadFromPersistence()
    }
    private(set)  var shoppingList = [ShoppingItem(name: "apple", image: "apple"), ShoppingItem(name: "grapes", image: "grapes"), ShoppingItem(name: "milk", image: "milk"), ShoppingItem(name: "muffin", image: "muffin"), ShoppingItem(name: "popcorn", image: "popcorn"), ShoppingItem(name: "strawberries", image: "strawberries")]



    func saveToPersistence() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print(error)
        }

    }
    func loadFromPersistence() {
        guard let url = shoppingListURL, FileManager.default.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print(error)
        }

    }


    func toggleLikeButton(for item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList[index].isLiked = !shoppingList[index].isLiked
        saveToPersistence()

    }

    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentDirectories = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

        let finalDestination = documentDirectories.appendingPathComponent("ShoppingList.plist")
        return finalDestination
    }

    var itemLike: [ShoppingItem] {
        let filterItems = shoppingList.filter { (item) -> Bool in
            return item.isLiked
        }
        return filterItems
    }

    var itemsNotLiked: [ShoppingItem] {
        let filterItems = shoppingList.filter { (item) -> Bool in
            return !item.isLiked
        }
        return filterItems
    }


}
