//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
/*A ShoppingItem model object with properties:

An image name ("apple")
A name of the item ("Apple")
A Bool indicating whether the item has been added to the shopping list
*/

struct ShoppingItem: Equatable {
    var imageName: String
    var itemName: String
    var hasBeenAdded: Bool
    var itemImage: UIImage
}
