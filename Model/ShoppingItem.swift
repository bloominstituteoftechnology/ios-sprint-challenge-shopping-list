//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var isOnList : Bool
    
    
    init(name: String, isOnList: Bool = false) {
        self.name = name
        self.isOnList = isOnList
    }
    
    
    
    
}



