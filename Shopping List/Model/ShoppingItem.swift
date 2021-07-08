//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Juan M Mariscal on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    var itemName: String = "Apple"
    var itemAdded: Bool = false
    
    var itemImageName: UIImage {
        guard let itemImage = UIImage(named: itemName) else { return UIImage() }
        return itemImage
    }
}
