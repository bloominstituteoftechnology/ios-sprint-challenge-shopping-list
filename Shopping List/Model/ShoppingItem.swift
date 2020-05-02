//
//  File.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
	
	var item: String = "Apple"
	var hasBeenAdded: Bool
	var imageName: String
	
	init(item: String, hasBeenAdded: Bool = false, imageName: String) {
		self.item = item
		self.hasBeenAdded = hasBeenAdded
		self.imageName = imageName
	}
	
}
