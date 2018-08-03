//
//  ShoppingListModel.swift
//  Shopping List
//
//  Created by William Bundy on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct CartItem: Comparable
{
	var name:String
	var requested:Bool

	static func <(l:CartItem, r:CartItem) -> Bool
	{
		if l.requested || r.requested {
			if l.requested && r.requested {
				return l.name < r.name
			}
			return l.requested
		}
		return l.name < r.name
	}
}

class CartModel
{
	let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
	var items:[CartItem] = []

	var addedItems:[CartItem] = []
	var unaddedItems:[CartItem] = []

	var itemSections:[[CartItem]] = { get {return [unaddedItems, addedItems]}}

	init()
	{
		for name in itemNames {
			items.append(CartItem(name:name, requested:false))
		}
	}

	func sortItems()
	{
		addedItems.removeAll(keepingCapacity: true)
		unaddedItems.removeAll(keepingCapacity: true)

		for item in items {
			if item.requested {
				addedItems.append(item)
			} else {
				unaddedItems.append(item)
			}
		}

		addedItems.sort()
		unaddedItems.sort()
	}

}
