//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    var nameOfItem: String
    var addedToList: Bool
    
    var image: UIImage {
        let itemImage = UIImage(named: "\(nameOfItem)")!
        return itemImage
    }
    
}
