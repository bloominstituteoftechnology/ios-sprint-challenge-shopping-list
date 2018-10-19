//
//  ShoppingCollectionCellDelegate.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingCollectionCellDelegate: class {
    func toggleAddedToList(for item: CollectionViewCell)
}

