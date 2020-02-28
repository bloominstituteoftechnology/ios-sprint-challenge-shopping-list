//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Shawn James on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    let name: String
    var added: Bool = false
    var image: UIImage? {
        return UIImage(named: name)
    }
}
