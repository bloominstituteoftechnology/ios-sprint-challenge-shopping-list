//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import UIKit

class ShopplingListController {
  
  //MARK:- Properties
  
  var shoppingItems: [ShoppingItem] = []
  private let persister = PersistenceStorage()
  private let itemNames: Array<String> = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
  
  private var isFirstLaunch: Bool {
    return UserDefaults.standard.bool(forKey: .firstLaunchKey) == true
  }
  
  //MARK:- Initialization
  init() {
    if isFirstLaunch == false  {
      createShoppingLists()
      UserDefaults.standard.set(true, forKey: .firstLaunchKey)
    } else {
      persister.loadFromPersistentStore(shop: &shoppingItems)
     
    }
  }
  
  //MARK:- Actions
  
  func toggleHasBeenAdded(for item: ShoppingItem) {
    if let itemIndex = shoppingItems.firstIndex(where: { $0.name == item.name } ) {
      shoppingItems[itemIndex].hasAdded.toggle()
    }
    persister.saveToPersistStore(for: shoppingItems)
  }
  
  private func createShoppingLists()  {
    shoppingItems = itemNames.map { ShoppingItem(name: $0, hasAdded: false) }
    persister.saveToPersistStore(for: shoppingItems)
  }
  
  var addedItems: [ShoppingItem] {
    return shoppingItems.filter{ $0.hasAdded }
  }
  
  var notAddedItems: [ShoppingItem] {
    return shoppingItems.filter { $0.hasAdded == false }
  }
}
