//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//


import Foundation
import UIKit

class ShoppingItem: Equatable, Codable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
    
    let image: Data
    let name: String
    var added: Bool
    
    init(image: Data, name: String, added: Bool = false) {
        self.image = image
        self.name = name
        self.added = added
    }
}


