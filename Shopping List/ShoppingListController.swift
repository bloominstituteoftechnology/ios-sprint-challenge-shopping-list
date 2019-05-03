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
        shoppingList.append(shoppingList)
    }
    
    func updateShoppingList(shoppingList: ShoppingList, imageData: Data, title: String) {
        guard let index = shoppingList.index(of: shoppingList) else { return }
        shoppingList[index].imageData = imageData
        shoppingList[index].title = title
    }
    
    var shoppingList: [ShoppingList] = []
}
