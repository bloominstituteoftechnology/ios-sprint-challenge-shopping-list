//
//  ShoppingListDelegate.swift
//  Shopping List
//
//  Created by beth on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingListDelegate: class {
    func toggleHasBeenAdded(cell: ListCollectionViewCell)
}
