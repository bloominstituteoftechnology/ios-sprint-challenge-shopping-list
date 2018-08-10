//
//  Item.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Item: Equatable, Codable{
    
    var name: String
    var image: Data
    var isAdded: Bool
    
    init(name: String, image: String, isAdded: Bool = true){
        self.name = name
        self.image = UIImagePNGRepresentation(UIImage(named: image)!)!
        self.isAdded = isAdded
    }

}
