//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit
import Photos

class ShoppingItemController {
    
    init() {
        loadFromPersistentStorage()
    }

    var items: [ShoppingItem] = [ShoppingItem(name: "Apple", image: UIImagePNGRepresentation(UIImage(named: "apple")!)!, isSelected: true ),
                                 ShoppingItem(name: "Grapes", image: UIImagePNGRepresentation(UIImage(named: "grapes")!)!, isSelected: true ),
                                 ShoppingItem(name: "Milk", image: UIImagePNGRepresentation(UIImage(named: "milk")!)!, isSelected: true ),
                                 ShoppingItem(name: "Muffin", image: UIImagePNGRepresentation(UIImage(named: "muffin")!)!, isSelected: true ),
                                 ShoppingItem(name: "Popcorn", image: UIImagePNGRepresentation(UIImage(named: "popcorn")!)!, isSelected: true ),
                                 ShoppingItem(name: "Soda", image: UIImagePNGRepresentation(UIImage(named: "soda")!)!, isSelected: true ),
                                 ShoppingItem(name: "Strawberries", image: UIImagePNGRepresentation(UIImage(named: "strawberries")!)!, isSelected: true )]

    func toggleIsSelected(for item: ShoppingItem){
        item.isSelected = !(item.isSelected)
        saveToPersistentStorage()
    }
    
    var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "ShoppingList.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    func saveToPersistentStorage(){
        
        let plistEncoder = PropertyListEncoder()
        
        do{
            let itemData = try plistEncoder.encode(items)
            guard let shoppingListURL = shoppingListURL else {return}
            try itemData.write(to: shoppingListURL)
            
        } catch {
            NSLog("Encoding Error: \(error)")
        }
        
    }
    
    func loadFromPersistentStorage(){
        
        do {
            guard let shoppingListURL = shoppingListURL else {return}
            let pListData = try Data(contentsOf: shoppingListURL)
            
            let plistDecoder = PropertyListDecoder()
            
            let decodedList = try plistDecoder.decode([ShoppingItem].self, from: pListData)
            
            self.items = decodedList
            
        } catch {
            NSLog("Decoding Error: \(error)")
        }
        
    }
    
    func areSelected() -> Int {
        var counter = 0
        for item in items {
            if item.isSelected {
                counter = counter + 1
            }
        }
        saveToPersistentStorage()
        return counter
    }
    
    
}


