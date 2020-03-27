//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var added: Bool
    
    var image: UIImage? {
        let pic = UIImage(named: name)
        return pic
    }
    
    
    init(name: String, added: Bool = false) {
        self.name = name
        self.added = added
    }
}

