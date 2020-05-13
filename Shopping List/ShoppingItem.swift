//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


struct ShoppingItem: Equatable, Codable {

    var name: String
    var isAdded: Bool
    
    init(isAdded: Bool = false, name: String, image: UIImage) {
        self.isAdded = isAdded
        self.name = name
    }
    
    var image: UIImage {
        return UIImage(named: name)!
    }
    
    
    
}
