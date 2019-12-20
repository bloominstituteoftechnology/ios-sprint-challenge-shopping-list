//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem
{
    var name: String
    var itemImage: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, itemImageName: String, hasBeenAdded: Bool)
    {
        self.name = name
        self.itemImage = UIImage(named: itemImageName)!
        self.hasBeenAdded = hasBeenAdded
    }
}
