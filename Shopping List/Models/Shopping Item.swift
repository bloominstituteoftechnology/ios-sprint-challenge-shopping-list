//
//  Shopping Item.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct Item: Codable {
    let name: String
    let image: String
    let itemWasAdded: Bool
}

let defaults = UserDefaults.standard
