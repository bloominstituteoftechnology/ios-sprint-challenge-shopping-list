//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    
    var name: String
//    var image: UIImage
    var hasBeenAddedToList: Bool = false
    
//    init(name: String, hasBeenAddedToList: Bool) {
//        self.name = name
////        self.image = UIImage(named: imageName)!
//        self.hasBeenAddedToList = hasBeenAddedToList
    }
