//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    let name: String
    let addedToList: Bool
    var image: UIImage
    
    
    init(name: String, addedToList: Bool, image: String) {
        self.name = name
        self.addedToList = addedToList
        self.image = UIImage(named: image)!
       
    }
}
