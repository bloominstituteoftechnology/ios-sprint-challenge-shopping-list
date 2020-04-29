//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var isAdded: Bool
    
    var image: UIImage {
        guard let image = (UIImage(named: name)) else { return UIImage() }
        return image
    }
    
}
