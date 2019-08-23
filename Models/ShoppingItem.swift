//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable {
	var itemName: String
	var hasBeenAdded: Bool
	var imageName: String

	init(itemName: String, hasBeenAdded: Bool, imageName: String) {
		self.itemName = itemName
		self.hasBeenAdded = hasBeenAdded
		self.imageName = imageName
	}

	var image: UIImage {
		return UIImage(named: imageName)!
	}
}
