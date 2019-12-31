//
//  ShoppingListDelegate.swift
//  Shopping List
//
//  Created by SenorLappy on 29/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
protocol ShoppingListDelegate: class {
    func toggleHasBeenAdded(cell: ShoppingItemsCollectionViewCell)
}
