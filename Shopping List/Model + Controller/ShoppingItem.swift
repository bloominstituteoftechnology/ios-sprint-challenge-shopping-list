//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable{
    
    var name: String
    var isSelected: Bool
    var imageData: Data
    
    init(name: String, isSelected:Bool, imageData: Data) {
        self.name = name
        self.isSelected = false
        self.imageData = imageData
    }
    
}
