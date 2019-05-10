//
//  Item.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class Item: Codable {
	
	
	var name: String
	var imageName: String
	var added: Bool
	
	init(name: String, imageName: String, added: Bool = false) {
		self.name = name
		self.imageName = imageName
		self.added = added
	}
	
}
