//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var addedOnTheShoppingList: Bool = false
    var image: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
}
