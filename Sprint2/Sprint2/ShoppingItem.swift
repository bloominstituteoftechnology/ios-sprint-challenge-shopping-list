//
//  ShoppingItem.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable, Codable {

    var name: String
    var isliked: Bool


    init(name: String, isliked: Bool = false) {
        self.name = name
        self.isliked = isliked
        var image: UIImage {
            return UIImage(named: name)!
        }

    }


}
