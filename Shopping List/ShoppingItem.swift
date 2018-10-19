//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lotanna on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

//Grocery item model
struct ShoppingItem: Codable, Equatable {
    var name: String
    var added: Bool
    var picture: Data
    
}


