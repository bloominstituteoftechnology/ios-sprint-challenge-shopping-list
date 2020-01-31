//
//  Model.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Encodable, Decodable{

    
    var name: String
    var hasBeenAddedToList: Bool
    var shoppingItemImage: UIImage
    
}
