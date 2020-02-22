//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chad Parker on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {

    let name: String
    var addedToList: Bool

    var image: UIImage {
        UIImage(named: name) ?? UIImage()
    }
}
