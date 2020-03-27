//
//  ListController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ListController {
    
    
    //MARK: - INITIALIZER
    init() {
        checkIfAppHasBeenLaunched()
    }
    
    
    //MARK: - PROPERTIES
    private(set) var shoppingList = [ShoppingItem]()
    
    let hasBeenLaunched = UserDefaults.standard.bool(forKey: "HasBeenLaunched")
    
    var itemsThatAreAdded: Int {
        var count = 0
        for item in shoppingList {
            if item.beenAdded {
                count += 1
            }
        }
        return count
    }
    
    var sortedShoppingList: [ShoppingItem] {
        return shoppingList.filter { $0.beenAdded } + shoppingList.filter { !$0.beenAdded}
    }
    
    //MARK: - METHODS
    func checkIfAppHasBeenLaunched() {
        if !hasBeenLaunched {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for item in itemNames {
                guard let image = UIImage(named: item) else {return}
                guard let imageData = UIImagePNGRepresentation(image) else {return}
                let shoppingItem = ShoppingItem(name: item, image: imageData)
                shoppingList.append(shoppingItem)
            }
            saveToPersistence()
            UserDefaults.standard.set(true, forKey: "HasBeenLaunched")
        } else {
            loadFromPersistance()
        }
    }
    
    func switchAddedToShoppingList(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].beenAdded = !shoppingList[index].beenAdded
        saveToPersistence()
    }
    
    func addItem(name: String, imageData: Data) {
        let shoppingItem = ShoppingItem(name: name, image: imageData)
        shoppingList.append(shoppingItem)
        saveToPersistence()
    }
    
    
    //MARK: - PERSISTENCE
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documentsDirectory.appendingPathComponent("shoppingList.plist")
    }
    
    
    func saveToPersistence() {
        guard let url = shoppingListURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let shoppingListData = try encoder.encode(shoppingList)
            try shoppingListData.write(to: url)
        } catch {
            NSLog("Error encoding data \(error)")
        }
    }
    
    func loadFromPersistance() {
        let fm = FileManager.default
        guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else {return}
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingList = decodedShoppingList
        } catch {
            NSLog("Can't decode data \(error)")
        }
    }
}
