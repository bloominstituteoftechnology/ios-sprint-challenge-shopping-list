//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lotanna on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

//Grocery item model
struct ShoppingItem: Equatable, Codable {
    var name: String
    var added: Bool
    var pictureName: String
    var picture: Data?
    
    init(name: String, pictureName: String) {
        self.name = name
        self.pictureName = pictureName
        self.added = false
    }
}


