//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rob Vance on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//
import UIKit
import Foundation

struct ShoppingItem: Codable, Equatable {
   
    var itemName: String
    var addToList: Bool
    var Image: UIImage? {
        let itemImage = UIImage(named: itemName)
        return itemImage
    }
   
}
