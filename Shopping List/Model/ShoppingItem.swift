//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import Foundation

struct ShoppingItem: Codable, Equatable{
    var itemName: String
    var hasBeenAdded: Bool
    var itemImageName: String
    var image: UIImage {
         return UIImage(named: itemImageName)!
    }
    
    init(itemName: String, itemImageName: String){
        self.itemName = itemName
        self.itemImageName = itemImageName
        self.hasBeenAdded = false
    }
}
