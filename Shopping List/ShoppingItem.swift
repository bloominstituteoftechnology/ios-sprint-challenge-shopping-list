//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable{

    let name: String
    var added: Bool
    let imageName: String
    init(name: String, imageName: String, added: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.added = added
    }

}


