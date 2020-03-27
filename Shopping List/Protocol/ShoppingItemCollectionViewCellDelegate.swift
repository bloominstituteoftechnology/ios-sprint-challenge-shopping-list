//
//  ShoppingItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Joshua Rutkowski on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemCollectionViewCellDelegate: AnyObject {
    func ItemTapped(forItem item: ShoppingItemCollectionViewCell)
}
