//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//



import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var item: String
    var added = false
    var image: UIImage? {
        return UIImage(named: item)
    }
}
