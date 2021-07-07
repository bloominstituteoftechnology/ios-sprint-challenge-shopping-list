//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var itemName: String
    var hasBeenAdded: Bool = false
}


