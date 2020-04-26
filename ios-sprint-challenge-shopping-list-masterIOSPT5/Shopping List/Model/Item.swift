//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class Item: Codable {
    
    var name: String
    var imageName: String
    var added: Bool
   
    
    init(name: String, wasAdded: Bool = false) {
        self.name = name
        self.imageName = name.lowercased()
        self.added = wasAdded
    }
    var image: UIImage {
        return UIImage(named:name)!
    }
}
