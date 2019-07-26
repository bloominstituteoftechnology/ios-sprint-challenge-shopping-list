//
//  Item.swift
//  Shopping List
//
//  Created by Jeffrey Santana on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Item: Equatable, Codable {
	let name: String
	var isInCart: Bool
	
	func getImage() -> UIImage? {
		return UIImage(named: name)
	}
}
