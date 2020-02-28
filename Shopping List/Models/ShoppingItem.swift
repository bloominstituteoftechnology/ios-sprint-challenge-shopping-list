//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasAddedItem: Bool
    var imageName: String
    
    init(name: String, hasAddedItem: Bool = false) {
        self.name = name
        self.imageName = name.lowercased()
        self.hasAddedItem = hasAddedItem
       }
    
    var image: UIImage  {
        return UIImage(named: imageName)!
    }
    
   
}
