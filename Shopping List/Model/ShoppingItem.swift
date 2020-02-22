//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasBeenAdded: Bool = false
    
    var image: UIImage?{
        let itemImage = UIImage(named: name)
        return itemImage
    }
}
