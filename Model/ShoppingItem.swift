//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Patrick Millet on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {
    
    var name: String
    var isAdded: Bool
    var image: Data

}

extension String {
    static let itemsHaveBeenCreated = "ItemsHaveBeenCreated"
    static let completeOrderSegue = "showDetailSegue"
}

