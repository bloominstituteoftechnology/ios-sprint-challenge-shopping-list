//
//  ItemListCollectionCellDelegate.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol ItemListCollectionCellDelegate: class
{
    func toggleItemAdded(for cell: ItemListCollectionViewCell)
}
