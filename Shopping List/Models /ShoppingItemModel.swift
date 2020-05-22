//
//  ShoppingItemModel.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable  {
    var name: String
    var added: Bool
    var image: UIImage
    
    init(name: String, added: Bool, imageName: String) {
    self.name = name
    self.added = added
    self.image = UIImage(named: imageName)!
    }
}
