//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Cora Jacobson on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var addedToList: Bool
    var imageName: String
}
