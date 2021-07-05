//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItem: Codable {
    let itemName: String
    let imageName: String
    var added: Bool

    
    init(itemName: String, added: Bool = false) {
        self.itemName = itemName
        self.imageName = itemName
        self.added = added
    }
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
}
