//
//  ShoppingItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: AnyObject {
    func ItemTapped(forItem item: ShoppingItemCollectionViewCell)
}
