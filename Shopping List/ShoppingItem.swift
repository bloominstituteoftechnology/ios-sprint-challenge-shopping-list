//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Evan Cruz on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
  
  var image: String
  var item: String
  var isAdded: Bool
  
  init(image: String, item: String, isAdded: Bool = false) {
    self.image = image
    self.item = item
    self.isAdded = isAdded
  }
}
