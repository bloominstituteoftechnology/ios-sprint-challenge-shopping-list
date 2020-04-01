//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingList: Equatable, Codable {
    
    var itemName: String
    var itemAdded: Bool
    var Image: UIImage {

        guard let image = UIImage(named: itemName) else {return UIImage()}
        return image
    }
}

struct Address {
    var name: String
    var address: String
}
