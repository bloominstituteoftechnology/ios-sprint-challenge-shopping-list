//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable{

    var image: UIImage {
        return UIImage(named: imageName)!
    }
    let name: String
    var added: Bool = false
    let imageName: String
    init(name: String, imageName: String, added: Bool) {
        self.name = name
        self.imageName = imageName
        self.added = added
    }

}


