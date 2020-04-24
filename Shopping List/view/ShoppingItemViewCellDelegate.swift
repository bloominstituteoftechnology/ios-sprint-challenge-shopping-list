//
//  ShoppingItemViewCellDelegate.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingItemViewCellDelegate {
    func toggleAddToCart(for cell: ShoppingItemViewCell)
}
