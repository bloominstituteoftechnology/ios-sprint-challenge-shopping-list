//
//  FoodItems.swift
//  Shopping List
//
//  Created by Anesa Krnic on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: NSObject, Codable {
    var name: String
    var imageName: String
    var added: Bool
    
    init (name: String, imageName: String, added: Bool) {
        self.name = name
        self.imageName = imageName
        self.added = added
    }
}
