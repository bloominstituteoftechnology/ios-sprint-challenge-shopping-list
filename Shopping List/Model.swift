//
//  Model.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Encodable, Decodable{

    
    
    var imageName: String
    var hasBeenAddedToList: Bool = false
  
    var image: UIImage {
           return UIImage(named: imageName)!
       }
}
