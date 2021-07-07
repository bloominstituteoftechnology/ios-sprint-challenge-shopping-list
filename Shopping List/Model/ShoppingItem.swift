//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


/// Model object  to create new instances of ShoppingItem
struct ShoppingItem: Equatable, Codable {
    let name: String
    var hasBeenAdded: Bool
    
    /// Initializer for the ShoppingItem object
    /// - Parameter name: The name of the object to be created.
    init(name: String) {
        self.name = name
        self.hasBeenAdded = false
    }
}
