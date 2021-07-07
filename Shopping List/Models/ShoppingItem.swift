//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var imageData : Data
    var name : String
    var addedToList : Bool = false
    
    init(imageData: Data, name : String, addedToList : Bool = false){
        self.imageData = imageData
        self.name = name
        self.addedToList = addedToList
    }
}
