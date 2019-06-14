//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    
    init(name: String, imageName: String, isOnList: Bool = false) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.isOnList = isOnList
    }
    
    var name: String
    var isOnList : Bool
    var image: UIImage
    
    
}


