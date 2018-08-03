//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable {
    
    
    //MARK: - INITIALIZER
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.addedToShoppingList = false
    }
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
        self.addedToShoppingList = false
    }
    
    //MARK: - PROPERTIES
    var name: String
    var image: UIImage
    var addedToShoppingList: Bool
    
    
    
}
