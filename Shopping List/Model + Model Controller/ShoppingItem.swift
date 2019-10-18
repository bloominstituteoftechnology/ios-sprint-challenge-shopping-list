//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable{
    
    
    let name: String
    var image: Data
    var isInList: Bool = false
    
    init(name: String, image: Data, isInList: Bool = false){
           
           self.image = image
           self.name = name
           self.isInList = isInList
       }
       
           
    
    
}
