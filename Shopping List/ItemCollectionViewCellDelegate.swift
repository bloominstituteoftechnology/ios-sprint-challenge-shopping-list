//
//  ItemCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ItemCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell)
}
