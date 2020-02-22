//
//  ItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol ItemCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(cell: ShoppingItemCollectionViewCell)
}
