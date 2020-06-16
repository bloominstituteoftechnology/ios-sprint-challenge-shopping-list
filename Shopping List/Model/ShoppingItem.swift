//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var itemName : String
    var imageString : String
    var hasBeenAdded : Bool = false
    
    var image : UIImage? {
        return UIImage(named: imageString)
    }
    
    init(itemName: String, imageString: String) {
          self.itemName = itemName
          self.hasBeenAdded = false
          self.imageString = imageString
      }
    
}
