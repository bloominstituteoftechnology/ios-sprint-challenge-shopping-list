//
//  Model.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable{
    var imageName: String
    var hasBeenAddedToList: Bool
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(imageName: String, hasBeenAddedToList: Bool = false) {
        self.imageName = imageName
        self.hasBeenAddedToList = hasBeenAddedToList
    }
}
