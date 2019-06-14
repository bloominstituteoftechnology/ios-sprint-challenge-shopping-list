import Foundation
import UIKit

class CartController
{
	let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
	var items:[CartItem] = []

	var addedItems:[CartItem] = []
	var unaddedItems:[CartItem] = []

	var itemSections:[[CartItem]] { get {return [unaddedItems, addedItems]}}

	init()
	{
		load()
		if items.count == 0 {
			for name in itemNames {
				items.append(CartItem(name:name, requested:false, img:UIImage(named: name)))
			}
			sortItems()
			save()
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

	func getURL() -> URL
	{
		return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ShoppinGCartItems.plist")
	}

	func save()
	{
		do {
			let enc = PropertyListEncoder()
			let data = try enc.encode(items)
			try data.write(to: getURL())
			
		} catch {
			print("Failed to write to default persist URL: ", getURL())
		}
	}

	func load()
	{
		let url = getURL()
		let fm = FileManager.default
		if !fm.fileExists(atPath: url.path) {
			return
		}

		do {
			let data = try Data(contentsOf: getURL())
			let dec = PropertyListDecoder()
			items = try dec.decode([CartItem].self, from: data)
			for i in 0..<items.count {
				items[i].img = UIImage(named:items[i].name)
			}
		} catch {
			print("Failed to load from default persist URL: ", url)
		}
	}

}
