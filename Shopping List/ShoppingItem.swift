//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable {
    let image: UIImage
    let name: String
    var addedToList: Bool
    
    init(image: UIImage, name: String, addedToList: Bool = false) {
        self.image = image
        self.name = name
        self.addedToList = addedToList
    }
}
