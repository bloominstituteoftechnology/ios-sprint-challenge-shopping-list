//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
	init(image: Data , name: String, added: Bool = false) {
		self.image = image
		self.name = name
		self.added = added
	}
	
	var image: Data
	var name: String
	var added: Bool
}
