//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    

    let items: [ShoppingItem] = [ShoppingItem(name: "Apple", image: UIImage(named: "apple")!, isSelected: true ),
                 ShoppingItem(name: "Grapes", image: UIImage(named: "grapes")!, isSelected: true ),
    ShoppingItem(name: "Milk", image: UIImage(named: "milk")!, isSelected: true ),
    ShoppingItem(name: "Muffin", image: UIImage(named: "muffin")!, isSelected: true ),
    ShoppingItem(name: "Popcorn", image: UIImage(named: "popcorn")!, isSelected: true ),
    ShoppingItem(name: "Soda", image: UIImage(named: "soda")!, isSelected: true ),
    ShoppingItem(name: "Strawberries", image: UIImage(named: "strawberries")!, isSelected: true )]
}
