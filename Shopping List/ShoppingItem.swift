//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Drew Miller on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Encodable {
    let name: String
    var purchased: Bool
    let image: UIImage
    
}


