//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    var name: String
    var hasBeenAdded: Bool
    var imageName: String

    
    init(name: String, hasBeenAdded: Bool, imageName: String){
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.imageName = imageName
   
    var image: UIImage {
        return UIImage(named: imageName)!
        }
    }
}
