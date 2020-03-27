//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {

    let name: String
    var didAdded: Bool

    var image: UIImage {
        UIImage(named: name) ?? UIImage()
    }
}

//Finished Project 






