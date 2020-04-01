//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

struct ShoppingItem: Codable {
    let name: String
    var isAdded: Bool
    var image: UIImage? {
        for i in itemNames {
            if i == name {
                return UIImage(named: i)
            }
        }
        return UIImage(named: itemNames[0])
    }
}
