//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



struct ShoppingItem
{
    var name: String
    var image: UIImage?
    var hasBeenAdded: Bool
    
    init(name: String)
    {
        self.name = name
        self.image = UIImage(named: name)
    }
}
