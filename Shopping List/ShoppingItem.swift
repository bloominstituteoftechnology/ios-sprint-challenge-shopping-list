//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    let image: UIImage
    let name: String
    let added: Bool = false
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
    
    
    
}
