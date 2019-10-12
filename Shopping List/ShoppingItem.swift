//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_201 on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var isAdded: Bool
    
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
        
    }
    

}
