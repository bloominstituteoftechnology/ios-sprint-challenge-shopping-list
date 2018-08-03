//
//  ShoppingItemCollectionCellDelegate.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionCellDelegate: class {
    func toggleAddedToList(for item: ShoppingCollectionViewCell)
}
