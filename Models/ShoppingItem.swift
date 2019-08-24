//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
	
	let itemName: String
	var hasBeenAdded: Bool
	let imageName: String

	init(name: String, hasBeenAdded: Bool = false){
		self.itemName = name
		self.hasBeenAdded = hasBeenAdded
		self.imageName = name
	}

	var image: UIImage {
		return UIImage(named: imageName)!
	}
}
