//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingList: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
    self.imageData = imageData
    self.title = title
}
}
