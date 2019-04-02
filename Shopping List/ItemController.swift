//
//  ItemController.swift
//  Shopping List
//
//  Created by Lotanna on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ItemController {

    var groceryList: [ShoppingItem] = []

    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

    var initKey = "initKey"

    // Initialisation
    init() {
        let initialisationCheck = UserDefaults.standard.bool(forKey: initKey)
        if initialisationCheck == true {
            retrieveFromPersistence()
        } else {
            createGroceries()
        }
    }

    func createGroceries() {
        for item in itemNames {
            let singleItem = ShoppingItem(name: item, pictureName: item)
            groceryList.append(singleItem)
            UserDefaults.standard.set(true, forKey: initKey)
            saveToPersistence()
        }
    }

    func updateGroceries(singleItem: ShoppingItem) {
        guard let index = groceryList.index(of: singleItem) else { return }
        var tempItem = singleItem
        tempItem.added = !singleItem.added
        groceryList.remove(at: index)
        groceryList.insert(tempItem, at: index)
        saveToPersistence()
    }

    //Saving
    func saveToPersistence() {
        let plistEncoder = PropertyListEncoder()
        do {
            let groceryData = try plistEncoder.encode(groceryList)
            guard let groceryFileURL = groceryFileURL else { return }
            try groceryData.write(to: groceryFileURL)
        } catch {
            NSLog("Something went wrong encoding the file: \(error)")
        }

    }

    //Retrieving
    func retrieveFromPersistence() {
        do {
            guard let groceryFileURL = groceryFileURL,
                FileManager.default.fileExists(atPath: groceryFileURL.path) else  { return }
            let groceryData = try Data(contentsOf: groceryFileURL)
            let plistDecoder = PropertyListDecoder()
            self.groceryList = try plistDecoder.decode([ShoppingItem].self, from: groceryData)
        } catch {
            NSLog("Something went wrong decoding the file: \(error)")
        }
    }

    var groceryFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "groceryList.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
}
