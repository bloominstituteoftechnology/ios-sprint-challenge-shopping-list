//
//  ShoppingCellDelegate.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell)
}
