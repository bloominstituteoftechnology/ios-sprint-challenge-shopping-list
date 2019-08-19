//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    
    var name: String
    var added: Bool
    //var image: UIImage
    
    init(name: String, added: Bool = false) {
        self.name = name
        self.added = added
        //self.image = UIImage(named: imageName)!
    }
}
