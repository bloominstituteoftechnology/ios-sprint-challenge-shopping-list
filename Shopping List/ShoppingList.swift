//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingList: Equatable, Codable {
    
    var imageData: Data
    var title: String
    var hasBeenAdded: Bool
    
    
    init(dataVar: Data, title: String, hasBeenAdded: Bool = false) {
    self.imageData = UIImage(data: dataVar)
    self.title = title
    self.hasBeenAdded = hasBeenAdded
    
}
}
