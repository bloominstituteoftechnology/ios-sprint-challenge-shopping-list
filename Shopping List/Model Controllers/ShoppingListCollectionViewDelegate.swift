//
//  ShoppingListCollectionViewDelegate.swift
//  Shopping List
//
//  Created by patelpra on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell)
}
