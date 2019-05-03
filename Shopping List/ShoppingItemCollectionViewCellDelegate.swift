//
//  ShoppingItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell)
}
