//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Niranjan Kumar on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable , Equatable {
    
    var name: String
    var hasBeenAdded: Bool = false
}
