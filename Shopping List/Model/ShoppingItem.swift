//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name : String
    var added : Bool = false
    
    var image : UIImage? {
        return UIImage(named: name)
    }
    
}
