//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {
    
    var name: String
    var image: Data
    var isInList: Bool
    
    init(image: Data,name: String, isInList: Bool = false){
        
        self.image = image
        self.name = name
        self.isInList = isInList
    }
    
}
