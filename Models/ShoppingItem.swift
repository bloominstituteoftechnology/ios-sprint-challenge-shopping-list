//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem : Codable  {
  var name : String
  var hasAdded : Bool
  
  var image: UIImage {
    UIImage(named: self.name)!
  }
}

