//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
	
	init(itemName: String, hasBeenAdded: Bool, imageName: String) {
		self.itemName = itemName
		self.hasBeenAdded = hasBeenAdded
		self.imageName = imageName
	}
	
	var itemName: String
	var hasBeenAdded: Bool
	var imageName: String
	
	var image: UIImage {
		return UIImage(named: imageName)!
	}
}
