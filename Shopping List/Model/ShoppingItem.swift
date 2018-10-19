//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    
    let name: String
    var added: Bool
    
    init(name: String, added: Bool = false) {
        (self.name, self.added) = (name, added)
    }
}
