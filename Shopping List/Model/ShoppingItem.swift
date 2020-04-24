//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chad Parker on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {

    let name: String
    var addedToList: Bool = false

    var image: UIImage {
        UIImage(named: name) ?? UIImage()
    }
}

extension ShoppingItem: Equatable {

    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
}
