//
//  ShoppingItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by morse on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: AnyObject {
    func ItemTapped(forItem item: ShoppingItemCollectionViewCell)
}
