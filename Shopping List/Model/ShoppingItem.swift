//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    
    var name: String
    var itemAdded: Bool
    var imageName: String
    
    init(name: String, itemAdded: Bool = false){
        self.name = name
        self.itemAdded = itemAdded
        self.imageName = name
    }
    
    var itemImage: UIImage! {
        UIImage(named: imageName)
       }
}

