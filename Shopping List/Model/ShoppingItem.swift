//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable, Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        if (lhs.name == rhs.name && lhs.image == rhs.image && lhs.isSelected == rhs.isSelected){
            return true
        }
        else {
            return false
        }
    }
    
    
    var name: String
    var image: Data
    var isSelected: Bool
    
    init(name: String, image: Data, isSelected: Bool) {
        self.name = name
        self.image = image
        self.isSelected = isSelected
    }
    
    
}
