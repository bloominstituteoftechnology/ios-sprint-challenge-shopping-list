//
//  ShoppingListDelegate.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
protocol ShoppingListDelegate: class {
    func toggleHasBeenAdded(cell: ShoppingListCollectionViewCell)
}
