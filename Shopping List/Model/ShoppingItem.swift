//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Welinkton on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    
    var name:String
    var imageName:String
    var isAdded:Bool
    var imageData:Data?

    init(name:String, imageName:String) {
        self.name = name
        self.imageName = imageName
        self.isAdded = false
    }
    
}


