//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var added: Bool
    
    var image: UIImage? {
        let pic = UIImage(named: name)
        return pic
    }
}
