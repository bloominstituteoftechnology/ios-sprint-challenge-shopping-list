//
//  ShoppingItemcollectionVCDelegate.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


protocol ShoppingItemCollectionViewCellDelegate: class {
    
    
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell)
    
}


