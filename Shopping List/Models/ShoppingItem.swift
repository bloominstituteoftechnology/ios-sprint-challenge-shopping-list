//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var name: String
    var hasBeenAdded: Bool
    
    var image: UIImage {
        guard let image = (UIImage(named: name)) else { return UIImage() }
        return image
    }
}
