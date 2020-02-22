//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable {
    var name: String
    var addedToShoppingList: Bool
    
    var image: UIImage {
        return UIImage(named: name)!
    }
}
