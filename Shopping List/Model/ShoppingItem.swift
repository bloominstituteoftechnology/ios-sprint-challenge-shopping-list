//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem  {
    
    
    var didSelectItemAt: Bool
    var image: UIImage
    var names: [String]


    init(didSelectItemAt: Bool = false, imageName: String, names: [String]) {
        self.didSelectItemAt = didSelectItemAt
        self.image = UIImage(named: imageName)!
        self.names = names
    }
}



