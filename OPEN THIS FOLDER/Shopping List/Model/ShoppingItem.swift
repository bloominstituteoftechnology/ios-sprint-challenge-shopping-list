//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_141 on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    var name: String
    var image: String
    var addedToShoppingList: Bool = false
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = imageName
    }
    var imagePicture: UIImage {
        return UIImage(named: image)!
    }
}

