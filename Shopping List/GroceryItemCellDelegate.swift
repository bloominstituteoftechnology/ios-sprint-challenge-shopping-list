//
//  GroceryItemCellDelegate.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol GroceryItemCellDelegate {
    func toggleCartStatus(for cell: GroceryItemCollectionViewCell)
}
