//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Norlan Tibanear on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var itemName: String
    var hasBeenAdded: Bool
    var imageString: String
    var itemImage: UIImage {
        return UIImage(named: imageString)!
    }
    
    init(itemName: String, imageString: String) {
        self.itemName = itemName
        self.hasBeenAdded = false
        self.imageString = imageString
    }
}



