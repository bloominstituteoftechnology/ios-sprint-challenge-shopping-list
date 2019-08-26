//
//  GroceryList.swift
//  Shopping List
//
//  Created by Austin Potts on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

//struct ShoppingItem {
//    var name: String
//    var image: UIImage
//
//    var hasBeenAdded: Bool
//    init(name: String, image: UIImage, hasBeenAdded: Bool = false) {
//        self.name = name
//        self.image = image
//        self.hasBeenAdded = hasBeenAdded
//    }
//}


class ShoppingItem: Codable {
    
    let name: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    var isAddedToList: Bool
    
    
    init(name: String, imageName: UIImage, isAddedToList: Bool = false) {
        self.name = name
        self.imageName = name.lowercased()
        self.isAddedToList = isAddedToList
    }
}
