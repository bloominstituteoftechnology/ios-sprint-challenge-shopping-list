//
//  ShoppingItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(for item: GroceryItemCollectionViewCell)
}
