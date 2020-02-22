//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Encodable, Decodable {
    var name: String
    var itemSelected: Bool = false
//    var image: UIImage
    
    init(name: String) {
        self.name = name
        
//        self.image = UIImage(named: imageName)!
    }
}
