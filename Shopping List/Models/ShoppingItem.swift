//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bree Jeune on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var item: String
    var hasBeenAdded: Bool = false
//    var image: UIImage
}

