//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Evan Cruz on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
  
  var shoppingItems: [ShoppingItem] = []
  
  func create(image: String, item: String) {
    let shoppingItem = ShoppingItem(image: image, item: item)
    shoppingItems.append(shoppingItem)
  }
  
  func update(shoppingItem: ShoppingItem, image: String, item: String) {
    guard let index = shoppingItems.index(of: shoppingItem) else { return }
    
    var scratch = shoppingItem
    scratch.image = image
    scratch.item = item
    
    shoppingItems.remove(at: index)
    shoppingItems.insert(scratch, at: index)
  }
  
  func delete(shoppingItem: ShoppingItem) {
    guard let index = shoppingItems.index(of: shoppingItem) else { return }
    shoppingItems.remove(at: index)
  }
}
