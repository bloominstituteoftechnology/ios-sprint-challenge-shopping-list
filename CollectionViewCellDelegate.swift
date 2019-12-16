//
//  CollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


protocol itemsAddedDelegate {
    func itemsAdded(_: ShoppingItem)
}

protocol shoppingListDelegate {
    func shoppingListSent(_: [ShoppingItem])
}
