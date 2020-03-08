//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    var name: String
    var addedOnTheShoppingList: Bool = false
    var imageName: String
    var picture: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(name: String) {
        self.name = name
        self.imageName = name
    }
}
