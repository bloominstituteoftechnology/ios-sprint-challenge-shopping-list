//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable {
    var image: UIImage
    var name: String
    var addedToShoppingList: Bool
    
    init(name: String, imageName: String, addedToShoppingList: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.addedToShoppingList = addedToShoppingList
    }
}

//On first launch, use the given shoppping item names and image names to create a ShoppingItem model and save them with persistence.


