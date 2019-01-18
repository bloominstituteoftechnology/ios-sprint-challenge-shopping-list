//
//  Model.swift
//  Shopping List
//
//  Created by Cameron Dunn on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
extension String{
    static var userDefaultKey = "ShoppingListSave"
}
import Foundation
import UIKit
class ShoppingListModel{
    var shoppingList : [ShoppingListItem] = []
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    func saveList(){
        UserDefaults.standard.set(shoppingList, forKey: .userDefaultKey)
    }
    func loadList(){
        guard let savedShoppingList = UserDefaults.standard.object(forKey: .userDefaultKey) else {
            print("There was nothing saved in user defaults")
            return
            
        }
        shoppingList = savedShoppingList as! [ShoppingListItem]
    }
    func createShoppingList(){
        
    }
    func editItemInList(sender: CustomCollectionViewCell){
        guard let index = shoppingList.index(of: sender.item!) else {return}
        if(shoppingList[index].itemAdded){
            shoppingList[index].itemAdded = false
            sender.button.setTitle("Not Added", for: .normal)
        }else{
            shoppingList[index].itemAdded = true
            sender.button.setTitle("Added", for: .normal)
        }
    }
    func createShoppingList(){
        for x in 0...6{
            var item = ShoppingListItem()
            item.nameOfItem = itemNames[x]
            item.image = UIImage(named: itemNames[x])
            shoppingList.append(item)
        }
    }
}
