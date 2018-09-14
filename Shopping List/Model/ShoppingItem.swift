//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rick Wolter on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable, Equatable {
    
    var image: Data
    var name: String
    var isInList: Bool
    
    init(image: Data,name: String, isInList: Bool = false){
        
        self.image = image
        self.name = name
        self.isInList = isInList
    }
}
