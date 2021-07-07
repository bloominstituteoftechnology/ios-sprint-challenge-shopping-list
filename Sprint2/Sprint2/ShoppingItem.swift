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
    var image: Data


    init(name: String, isliked: Bool = false, image: Data) {
        self.name = name
        self.isliked = isliked
        self.image = image



    }


}
