//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

struct ShoppingItem: Codable {
    var name: String 
    var hasBeenAdded: Bool
    
    var image: UIImage? {
        for i in itemNames {
            if i == name {
                return UIImage(named: i)
            }
        }
        
        //Return Default
        return UIImage(named: itemNames[0])
    }
}
