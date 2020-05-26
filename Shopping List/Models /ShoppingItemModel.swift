//
//  ShoppingItemModel.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable {
    var name: String
    var added: Bool = false
    var imageName: String
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(name: String, imageName: String) {
    self.name = name
    self.imageName = imageName
    }
    

}



