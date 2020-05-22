//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCellDelegate: class {
    func cellWasTapped()
    
    func updateViews()
}

class ShoppingItemsCollectionViewCell: UICollectionViewCell, ShoppingListCellDelegate {
    
    weak var delegate: ShoppingListCellDelegate?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isOnListButton: UIButton!
    
    func cellWasTapped(cell: ShoppingItemsCollectionViewCell) {
        if cell.isOnListButton.isSelected == true {
            cell.isOnListButton.isSelected = false
        } else {
            cell.isOnListButton.isSelected = true
        }
        saveToPersistentStore()
    }
}
