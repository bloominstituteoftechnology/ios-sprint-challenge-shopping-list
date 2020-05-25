//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Drew Miller on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var purchased: Bool = false
    var image: String
    
}


