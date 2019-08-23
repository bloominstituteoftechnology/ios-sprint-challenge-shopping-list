//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable {
    var itemName: String
    var image: UIImage
    var added: Bool
    
    init(itemName: String, imageName: String, added: Bool) {
        self.itemName = itemName
        self.image = UIImage(named: imageName)!
        self.added = added
    }
}
