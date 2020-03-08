//
//  Shopping Item.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


struct Item: Codable, Equatable {
    
    var name: String
    var itemWasAdded: Bool
    
    init(name: String) {
        self.name = name
        self.itemWasAdded = false
    }
    
}//End of class
