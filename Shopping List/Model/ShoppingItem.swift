//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

final class ShoppingItem {
    var imageData: Data
    var name: String
    var addedToList: Bool
    
    init(imageData: Data, name: String, addedToList: Bool = false) {
        self.imageData = imageData
        self.name = name
        self.addedToList = addedToList
    }
}
// MARK: - Codable
extension ShoppingItem: Codable {
    
}
// MARK: - Equatable
extension ShoppingItem: Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.imageData == rhs.imageData
    }
    
    
}
