//
//  PersistenceController.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

extension ShoppingItemController{
    
    var shoppingItemURL : URL?{
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let fileName = "ShoppingList.plist"
        return documentsDirectory.appendingPathComponent(fileName)
        
        }
    
    //SaveToPersistence
    func saveToPersistence(){
        guard let itemUrl = shoppingItemURL else {return}
        let plistEncoder = PropertyListEncoder()
        do {
            let itemData = try plistEncoder.encode(shoppingItems)
            try itemData.write(to: itemUrl)
        }catch let error{
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
    
    //decodable is when you get the translated data from the system
    func loadFromPersistence() {
        let fm = FileManager.default
        guard let itemUrl = shoppingItemURL, fm.fileExists(atPath: itemUrl.path) else {return}
        let plistDecoder = PropertyListDecoder()
        do {
            let itemData = try Data(contentsOf: itemUrl)
            let decodedItem = try plistDecoder.decode([Item].self, from: itemData)
            shoppingItems = decodedItem
        } catch let error{
            //print there was a problem saving your data
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
        
}
