//
//  ShoppingItemDelegate.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol ItemCollectionCellDelegate: class {
    func hasBeenSelected(for cell: ShoppingItemCollectionViewCell)
}
