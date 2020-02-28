//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit
struct ShoppingItems: Equatable {
    var imageData: Data
    var title: String
    var isAdded: Bool
}
extension ShoppingItems: Codable {
    
}
