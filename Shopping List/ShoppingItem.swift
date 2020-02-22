//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Juan M Mariscal on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem {
    var item: String = "Apple"
    var itemAdded: Bool = false

    var itemImage: UIImage {
        guard let itemImage = UIImage(named: item) else { return UIImage() }
        return itemImage
    }
}
