//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var isAdded: Bool
    var image: UIImage {
        return UIImage(named: name)!
    }
}



