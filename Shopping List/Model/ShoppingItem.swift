//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Items {
    var name: String
    var added: Bool
    
    init(name: String, added: Bool) {
        self.name = name
        self.added = added
    }
}
