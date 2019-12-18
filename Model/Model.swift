//
//  Model.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {

    let itemName: String
    var isAdded: Bool
//    var imageName: String

    
    init(itemName: String, isAdded: Bool = false, imageName: String) {
        self.itemName = itemName
        self.isAdded = isAdded
//        self.imageName = itemName
    }
//    var image: UIImage {
//        return UIImage(named: imageName)!
//    }
}
