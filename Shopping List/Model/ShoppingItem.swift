//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable
{
    var name: String
    var imageData: Data
    var isSelected: Bool
}
