//
//  MyOrderedSet.swift
//  Reading List
//
//  Created by Michael Redig on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

public struct QuickOrderedSet<Type: Codable & Hashable> {
	private(set) var sequencedContents: [Type]
	private(set) var contents: [Type: Int]

	init() {
		sequencedContents = []
		contents = [:]
	}
	
	func index(of object: Type) -> Int? {
		if let index = contents[object] {
			return index
		}
		return nil
	}
	
	mutating func append(_ element: Type) {
		if contents[element] != nil {
			remove(element)			
		}
		contents[element] = contents.count
		sequencedContents.append(element)
	}
	
	mutating func remove(_ element: Type) {
		guard let index = contents[element] else { return }
		remove(at: index)
	}
	
	mutating func remove(at index: Int) {
//		guard sequencedContents.count > index else { return } // dno if this is a good idea or not
		let objectAtIndex = sequencedContents[index]
		contents.removeValue(forKey: objectAtIndex)
		sequencedContents.remove(at: index)
		for index in index..<sequencedContents.count {
			contents[sequencedContents[index]] = index
		}
	}
	
	func contains(_ element: Type) -> Bool {
		return contents[element] != nil
	}
	
	public subscript(index: Int) -> Type {
		get {
			return sequencedContents[index]
		}
		set {
			var index = index
			var removedElement = false
			if let oldIndex = contents[newValue], oldIndex != index {
				//remove existing value (coalesce to the rest of the stuff)
				remove(newValue)
				removedElement = true
				if oldIndex < index {
					index -= 1
				}
			}
			if removedElement && index == sequencedContents.count {
				append(newValue)
			}
			if sequencedContents[index] != newValue {
				contents.removeValue(forKey: sequencedContents[index])
			}
			sequencedContents[index] = newValue
			contents[newValue] = index
		}
	}
	
	//TODO: Insert at
	
	public var count: Int {
		return sequencedContents.count
	}
	
	public var isEmpty: Bool {
		return sequencedContents.isEmpty
	}
	
	
	
	enum CodingKeys: String, CodingKey {
		case sequencedContents
		case contents
	}
}

extension QuickOrderedSet: RandomAccessCollection {
	public var startIndex: Int {
		return 0
	}
	
	public var endIndex: Int {
		return sequencedContents.count
	}
}

extension QuickOrderedSet: Codable {

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(sequencedContents, forKey: CodingKeys.sequencedContents)

	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		sequencedContents = try container.decode([Type].self, forKey: .sequencedContents)
		contents = [:]
		for (index, element) in sequencedContents.enumerated() {
			contents[element] = index
		}
	}
}

extension QuickOrderedSet: CustomStringConvertible {
	public var description: String {
		return sequencedContents.description
	}
	
}
