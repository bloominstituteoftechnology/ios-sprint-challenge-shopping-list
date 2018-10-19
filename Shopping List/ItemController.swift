//
//  ItemController.swift
//  Shopping List
//
//  Created by Lotanna Igwe-Odunze on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ItemController {
    
    var shoppingList: [ShoppingItem] = []
    
    //Selected items
    var selections: [ShoppingItem]{
        return shoppingList.filter{$0.added == true } }
    
    //Creating file to store items in
    var fileURL: URL?{
        let fileStorage = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingFile = "ShoppingList.plist"
        return fileStorage?.appendingPathComponent(shoppingFile)
    }
    
    //Saving to persistence
    func saveShoppingFile(){
        guard let fileURL = fileURL else {return}
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(shoppingList)
            try data.write(to: fileURL)
            
        } catch {
            NSLog("Something went wrong") }
    }
    
    //Loading from persistence
    
    func retrieveShoppingFile(){
        guard let fileURL = fileURL, FileManager.default.fileExists(atPath: fileURL.path) else {return}
        
        let decoder = PropertyListDecoder()
        
        do{
            let data = try Data(contentsOf: fileURL)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error decoding")
        }
    }
        

    //Initialisation
        
    init() {
    
    var initialisationCheck: Bool? = UserDefaults.standard.bool(forKey: "myKey")
    //Making sure item only initialises once.
    if initialisationCheck == false {
        
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
        //Adding name, image, and status to each item.
        for item in itemNames {
            
            guard let itemPhoto = UIImage(named: item), //Unwraps the UIimage name of each item
            let picture = UIImagePNGRepresentation(itemPhoto) else {return} //Assigns the corresponding photo to each item
            
            //Create an instance of ShoppingItem for each item in the array
            let singleItem = ShoppingItem(name: item, added: false, picture: picture)
            
            shoppingList.append(singleItem) //Add each item to the shopping list
            
        } //End of for loop.
        
        UserDefaults.standard.set(true, forKey: "myKey")
        
    }//End of if statement.
        
        }//End of Init.
    
    //Switching between Added and Not Added status
    func changeSelection(forItem item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].added = !shoppingList[index].added
        
        saveShoppingFile()
    }

}//End of ItemController Class.
