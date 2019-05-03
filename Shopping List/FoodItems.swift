//
//  FoodItems.swift
//  Shopping List
//
//  Created by Anesa Krnic on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct FoodItem {
    
    init (name: String, imageName: String, added: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.added = added
        
    }
    
    var name: String
    var image: UIImage
    var added: Bool
}
