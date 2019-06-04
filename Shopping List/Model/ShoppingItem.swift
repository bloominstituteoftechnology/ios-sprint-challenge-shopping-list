//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    init(itemName: String, addedToCart: Bool = false) {
        
        self.itemName = itemName
        self.addedToCart = addedToCart
        
    }
    
    var itemName   : String
    var addedToCart: Bool
    
    var image: UIImage {
        
        return UIImage(named: itemName)!
     
        
    }
    
}
