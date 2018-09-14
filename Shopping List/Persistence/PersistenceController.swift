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
        let fileName = "Shopping List.plist"
        return documentsDirectory.appendingPathComponent(fileName)
        
        }
    
    //SaveToPersistence
    func saveToPersistence(){
        let plistEncoder = PropertyListEncoder()
        do {
            guard let shoppingItems = shoppingItemURL else {return}
            let itemData = try plistEncoder.encode(shoppingItems)
            try itemData.write(to: shoppingItems)
        }catch let error{
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
    
    //decodable is when you get the translated data from the system
    func loadFromPersistence() {
        do {
            guard let shoppingItems = shoppingItemURL else {return}
            let itemData = try Data(contentsOf: shoppingItems)
            let plistDecoder = PropertyListDecoder()
            let decodedItem = try plistDecoder.decode([Item].self, from: itemData)
            self.shoppingItems = decodedItem
        } catch let error{
            //print there was a problem saving your data
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
        
}
