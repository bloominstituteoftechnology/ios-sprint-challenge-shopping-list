//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable{
    var itemName: String
    var hasBeenAdded: Bool = false
    var imageName: String
    var imageData: Data?
    
    init(itemName: String, imageName: String){
        self.itemName = itemName
        self.imageName = imageName
    }
}
