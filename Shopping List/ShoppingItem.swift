//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable {
    var name = "Apple"
    var hasBeenAdded: Bool = false
    
   
    let itemPerference = itemNames
    
    func savePreference() {
        UserDefaults.standard.set(itemPerference, forKey: itemPreferenceKey)
    }
    
    func loadPerference() {
        let itemPerference = UserDefaults.standard.string(forKey: itemPreferenceKey)
    }
    
    let itemPreferenceKey = "itemPreference"
       
    private var persistentFileURL: URL? {
        //iphones file system
        let fileManager = FileManager.default
        //we want to store our documents in a documentDiretory (in iOS)
        //user directory
        //find the first url for document directory or return nil
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        //final pass component
        //coercing it and telling it it's going to be items.plist
        return documents.appendingPathComponent("items.plist")
    }
    
    func savetoPersistentStore() {
        //need a url for a place we can properly save to
        // drop point so you can inspect the url(click hold on number li)
        guard let url = persistentFileURL else { return }
        //encode our star objects so they can be added to a plist file
    do {
        let encoder = PropertyListEncoder()
        //try to encode  objects. If unable, it is going to log the item
        let data = try encoder.encode(itemNames)
        //write that data to the url to save
        try data.write(to: url)
    } catch {
        print("Error saving itemNames data: \(error)")

    }


    }


}




 
