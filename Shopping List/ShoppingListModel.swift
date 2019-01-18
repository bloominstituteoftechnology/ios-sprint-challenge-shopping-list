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
    var addedItemsList : [ShoppingListItem] = []
    var arrayData : Data = Data()
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    func saveList(){
        do{
            try arrayData = PropertyListEncoder().encode(shoppingList)
        }catch{
            print(error)
        }
        UserDefaults.standard.set(arrayData, forKey: .userDefaultKey)
    }
    func loadList(){
        guard let nilCheck = UserDefaults.standard.object(forKey: .userDefaultKey) else {return}
        if(nilCheck != nil){
        arrayData = UserDefaults.standard.object(forKey: .userDefaultKey) as! Data
        do{
            let savedShoppingList = try PropertyListDecoder().decode([ShoppingListItem].self, from: arrayData)
            shoppingList = savedShoppingList
        }catch{
            print(error)
        }
        }
    }
    func createShoppingListArray(){
        addedItemsList = shoppingList.filter{$0.itemAdded==true}
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
            item.image = UIImageJPEGRepresentation(UIImage(named: itemNames[x])!, 1)
            shoppingList.append(item)
        }
    }
}
