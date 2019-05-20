//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Cameron Dunn on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingListItem: Equatable, Encodable, Decodable{
    var image : Data?
    var nameOfItem : String
    var itemAdded : Bool
    init(){
        image = nil
        itemAdded = false
        nameOfItem = ""
    }
}
