import Foundation
import UIKit

struct CartItem: Equatable, Comparable, Codable
{
	var name:String
	var requested:Bool
	var img:UIImage!

	enum CodingKeys: String, CodingKey
	{
		case name
		case requested
	}

	static func ==(l:CartItem, r:CartItem) -> Bool
	{
		return l.name == r.name
	}

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

