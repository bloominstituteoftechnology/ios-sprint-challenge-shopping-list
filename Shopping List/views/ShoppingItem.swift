//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by LaFleur on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
            let lhs = rhs
    }
    
    let shoppingItem: String
    var added: Bool = false
    var image: UIImage
    
    init(shoppingItem: String, imageName:String) {
        self.shoppingItem = shoppingItem
        self.image = UIImage(named: imageName)!
    }
    
}
