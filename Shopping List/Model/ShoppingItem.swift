//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
    
    var name: String
//    var image: UIImage
    var hasBeenAddedToList: Bool
    
    init(name: String, hasBeenAddedToList: Bool) {
        self.name = name
//        self.image = UIImage(named: imageName)!
        self.hasBeenAddedToList = hasBeenAddedToList
    }
}
