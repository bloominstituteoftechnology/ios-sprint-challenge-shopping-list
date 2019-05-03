//
//  Item.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Item {
	
	init(name: String, imageName: String) {
		self.name = name
		self.image = UIImage(named: imageName)!
	}
	
	var name: String
	var image: UIImage
}
