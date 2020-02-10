//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Lambda_School_Losaner_256 on 1/31/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import Foundation
import UIKit


struct ShoppingItem: Codable, Equatable {
    let itemName: String
    var added: Bool
    var image: UIImage? {
        let itemImage = UIImage(named: itemName)
        return itemImage
        
       
        
    }
    
}

