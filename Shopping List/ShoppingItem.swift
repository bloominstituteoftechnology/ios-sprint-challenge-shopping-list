//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Christopher Aronson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    
    var image: String
    var title: String
    var added: Bool
    
    init(image: String, title: String, added: Bool = false) {
        
        self.image = image
        self.title = title
        self.added = added
    }
}
