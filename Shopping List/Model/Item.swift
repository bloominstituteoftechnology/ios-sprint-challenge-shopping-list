//
//  Item.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Item: Codable, Equatable{
    
    var name: String
    var image: Data
    var isAdded: Bool
    
    init(name: String, image: Data, isAdded: Bool = false){
        self.name = name
        self.image = image
        self.isAdded = isAdded
    }

}
