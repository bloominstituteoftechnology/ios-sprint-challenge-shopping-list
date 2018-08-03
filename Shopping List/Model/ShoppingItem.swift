//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Equatable, Codable {
    
    //MARK: PROPERTIES
    var name: String
    var image: Data
    var beenAdded: Bool
    
    
    //MARK: INITIALIZER
    init(name: String, image: Data) {
        self.name = name
        self.image = image
        self.beenAdded = false
    }
    
}
