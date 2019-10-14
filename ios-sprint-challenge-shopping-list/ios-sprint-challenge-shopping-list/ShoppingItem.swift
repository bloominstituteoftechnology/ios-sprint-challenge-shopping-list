//
//  ShoppingItem.swift
//  ios-sprint-challenge-shopping-list
//
//  Created by Nicolas Rios on 10/13/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var isAdded: Bool
    
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
        
    }
    

}
