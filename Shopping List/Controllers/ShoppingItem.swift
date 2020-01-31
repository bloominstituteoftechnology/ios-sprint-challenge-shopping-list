//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Enrique Gongora on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable{
    var item: String
    var addedToList: Bool
    
    var image: UIImage?{
        let itemImage = UIImage(named: item)
        return itemImage
    }
}
