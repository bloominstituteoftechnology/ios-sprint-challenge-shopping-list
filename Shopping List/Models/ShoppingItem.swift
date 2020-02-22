//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var itemName: String
    var hasBeenAdded: Bool
    var itemImage: UIImage? {
        return UIImage(contentsOfFile: "\(itemName).png")
    }
}
