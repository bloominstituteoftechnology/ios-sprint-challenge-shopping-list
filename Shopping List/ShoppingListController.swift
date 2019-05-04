//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
   
    func createShoppingList(imageData: Data, title: String) {
        let shoppingList = ShoppingList(imageData: imageData, title: title)
        shoppingLists.append(shoppingList)
    }
    
    func updateShoppingList(shoppingList: ShoppingList, imageData: Data, title: String) {
        guard let index = shoppingLists.index(of: shoppingList) else { return }
        shoppingLists[index].imageData = imageData
        shoppingLists[index].title = title
    }
    
    var shoppingLists: [ShoppingList] = []
}
