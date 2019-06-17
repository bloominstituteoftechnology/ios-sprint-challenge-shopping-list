//
//  ShoppingListCellDelegate.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingListCellDelegate: class {
    func toggleIfInShoppingCart(for cell: ShoppingItemCollectionViewCell)
    
}
