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
    var wasAdded: Bool
    //var image: UIImage//{
    //        return UIImage(named: UIImage)!
    //    }
    
    init(name: String, wasAdded: Bool = false) {
        self.name = name
      //  self.image = UIImage(named: imageName)!
        self.wasAdded = wasAdded
    }
}
