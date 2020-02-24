//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct Items: Encodable, Decodable {
    
    var name: String
    //var image: UIImage
    var wasAdded: Bool
    
    init(name: String, imageName: String, wasAdded: Bool = false) {
        self.name = name
       // self.image = UIImage(named: imageName)!
        self .wasAdded = wasAdded
    }
}
