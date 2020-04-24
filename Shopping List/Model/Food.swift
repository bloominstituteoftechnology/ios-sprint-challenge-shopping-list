//
//  Food.swift
//  Shopping List
//
//  Created by Sherene Fearon on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//
import UIKit
import Foundation

let newOrder = NewOrderViewController()

struct ShoppingItem: Equatable {
    
    var name: String
    var image: UIImage
    var beenAdded: Bool = false

    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
    }
}

