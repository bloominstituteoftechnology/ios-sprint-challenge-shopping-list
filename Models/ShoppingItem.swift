//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit


struct ShoppingItem {
    var name : String
    var isAdded : Bool
    
    var image: UIImage? {
        let itemImage = UIImage(named: name)
        return itemImage
    }
}

