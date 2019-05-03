//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable{
    
    let image: UIImage
    let name: String
    var added: Bool = false
    
    init(name: String, imageName: String, added: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.added = added
    }
    
    
    
}
