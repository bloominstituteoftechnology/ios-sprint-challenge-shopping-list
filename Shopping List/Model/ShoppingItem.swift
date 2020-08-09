//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Marlon Raskin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit



struct ShoppingItem: Codable, Equatable {

	let name: String
	let imageName: String
	var isAdded: Bool

	var image: UIImage {
		return UIImage(named: imageName)!
	}

	init(name: String, imageName: String, isAdded: Bool = false) {
		self.name = name
		self.imageName = imageName
		self.isAdded = isAdded
	}
}
