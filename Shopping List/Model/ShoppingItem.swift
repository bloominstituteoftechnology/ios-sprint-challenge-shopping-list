//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable {
    
    var itemName: String
    var didSelectItemAt: Bool
    var image: UIImage


    init(didSelectItemAt: Bool = false, imageName: String, itemName: String) {
        self.didSelectItemAt = didSelectItemAt
        self.image = UIImage(named: imageName)!
        self.itemName = itemName
    }
}



