//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


struct ShoppingItem: Codable {
    
    var itemName: String
    var itemHasBeenAdded: Bool
    var image: UIImage
    
    init(itemName: String, imageName: String) {
        self.itemName = itemName
        self.image = UIImage(named: itemName)!
        self.itemHasBeenAdded = false
    }
        
        
    
}
