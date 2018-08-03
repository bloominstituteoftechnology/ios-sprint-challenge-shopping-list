//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem
{
    var imageIcon: UIImage
    var itemName: String
    var itemAdded: Bool
    var checkboxImage: UIImage
    
    init(itemName:String, iconName: String, checkedName: String, itemAdded: Bool = false)
    {
        self.itemName = itemName
        self.imageIcon = UIImage(named:iconName)!
        self.itemAdded = itemAdded
        self.checkboxImage = UIImage(named:checkedName)!
    }
    
}
