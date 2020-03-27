//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable {
    let name: String
    var didAdd: Bool = false
    var image: UIImage {
        return UIImage(named: name)!
    }
}
